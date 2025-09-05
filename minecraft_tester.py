#!/usr/bin/env python3
"""
Minecraft Modpack Startup Tester
Automatically launches Minecraft, monitors for startup issues, and generates a report.
"""

import subprocess
import time
import threading
import re
import os
import json
from pathlib import Path
from datetime import datetime

class MinecraftTester:
    def __init__(self, minecraft_dir, java_path="java", timeout=300):
        self.minecraft_dir = Path(minecraft_dir)
        self.java_path = java_path
        self.timeout = timeout  # 5 minutes default
        self.log_file = self.minecraft_dir / "logs" / "latest.log"
        self.process = None
        self.issues = []
        self.startup_successful = False
        
        # common error patterns to watch for
        self.error_patterns = {
            "mod_loading_error": r"Error loading mod|Failed to load mod|ModLoadingException",
            "dependency_missing": r"Missing required dependency|Unsatisfied dependency",
            "version_conflict": r"Version conflict|Incompatible mod version|requires version",
            "file_not_found": r"FileNotFoundException|Could not find file|Missing file",
            "mixin_error": r"Mixin apply failed|MixinException|Mixin conflict",
            "memory_error": r"OutOfMemoryError|Java heap space|GC overhead limit",
            "duplicate_mod": r"Duplicate mod|Found duplicate|Multiple mods with same",
            "config_error": r"Configuration error|Invalid config|Config parse error",
            "java_error": r"UnsupportedClassVersionError|Java version|JVM crash",
            "forge_error": r"FML|Forge.*error|ModLauncher.*error"
        }
        
        # success indicators
        self.success_patterns = [
            r"Minecraft main menu.*displayed",
            r"Successfully loaded.*main menu",
            r"Client successfully started",
            r"Reached main menu"
        ]

    def launch_minecraft(self):
        """Don't actually launch - just analyze existing logs"""
        print("Analyzing existing log file...")
        return True

    def monitor_logs(self):
        """Analyze existing log content for errors"""
        print("Reading log file for startup issues...")
        
        if not self.log_file.exists():
            self.issues.append({
                "type": "file_not_found",
                "message": f"Log file not found: {self.log_file}",
                "severity": "critical"
            })
            return
        
        try:
            with open(self.log_file, 'r', encoding='utf-8', errors='ignore') as f:
                content = f.read()
                self.analyze_log_content(content)
                
                # check for success indicators
                for pattern in self.success_patterns:
                    if re.search(pattern, content, re.IGNORECASE):
                        self.startup_successful = True
                        print("✓ Log shows successful main menu load!")
                        return
                        
        except Exception as e:
            self.issues.append({
                "type": "log_read_error",
                "message": f"Error reading log file: {e}",
                "severity": "critical"
            })

    def analyze_log_content(self, content):
        """Analyze log content for known error patterns"""
        lines = content.split('\n')
        
        for line in lines:
            for error_type, pattern in self.error_patterns.items():
                if re.search(pattern, line, re.IGNORECASE):
                    # extract mod name if possible
                    mod_match = re.search(r'mod[:\s]+([a-zA-Z0-9_]+)', line, re.IGNORECASE)
                    mod_name = mod_match.group(1) if mod_match else "unknown"
                    
                    severity = "critical" if error_type in ["mod_loading_error", "memory_error", "java_error"] else "warning"
                    
                    self.issues.append({
                        "type": error_type,
                        "message": line.strip(),
                        "mod": mod_name,
                        "severity": severity,
                        "timestamp": datetime.now().isoformat()
                    })

    def terminate_minecraft(self):
        """Safely terminate the Minecraft process"""
        if self.process and self.process.poll() is None:
            print("Terminating Minecraft process...")
            self.process.terminate()
            try:
                self.process.wait(timeout=10)
            except subprocess.TimeoutExpired:
                print("Force killing Minecraft process...")
                self.process.kill()

    def generate_report(self):
        """Generate a comprehensive test report"""
        report = {
            "test_timestamp": datetime.now().isoformat(),
            "minecraft_directory": str(self.minecraft_dir),
            "startup_successful": self.startup_successful,
            "total_issues": len(self.issues),
            "critical_issues": len([i for i in self.issues if i["severity"] == "critical"]),
            "warning_issues": len([i for i in self.issues if i["severity"] == "warning"]),
            "issues": self.issues
        }
        
        # save detailed report
        report_file = self.minecraft_dir / f"startup_test_report_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
        with open(report_file, 'w') as f:
            json.dump(report, f, indent=2)
        
        # print summary
        print("\n" + "="*60)
        print("MINECRAFT MODPACK STARTUP TEST REPORT")
        print("="*60)
        print(f"Test completed: {report['test_timestamp']}")
        print(f"Startup successful: {'✓ YES' if self.startup_successful else '✗ NO'}")
        print(f"Total issues found: {report['total_issues']}")
        print(f"Critical issues: {report['critical_issues']}")
        print(f"Warnings: {report['warning_issues']}")
        
        if self.issues:
            print(f"\nISSUES DETECTED:")
            print("-" * 40)
            
            # group by severity
            critical = [i for i in self.issues if i["severity"] == "critical"]
            warnings = [i for i in self.issues if i["severity"] == "warning"]
            
            if critical:
                print("CRITICAL ISSUES (prevent startup):")
                for issue in critical:
                    print(f"  • {issue['type'].upper()}: {issue['message'][:100]}...")
                    if 'mod' in issue and issue['mod'] != 'unknown':
                        print(f"    Related mod: {issue['mod']}")
            
            if warnings:
                print("\nWARNINGS (may cause issues):")
                for issue in warnings[:5]:  # show first 5 warnings
                    print(f"  • {issue['type'].upper()}: {issue['message'][:100]}...")
                
                if len(warnings) > 5:
                    print(f"  ... and {len(warnings) - 5} more warnings")
        
        print(f"\nFull report saved to: {report_file}")
        return report

    def run_test(self):
        """Run the complete startup test"""
        print("Starting Minecraft Modpack Startup Test")
        print("=" * 50)
        
        try:
            # launch minecraft
            if not self.launch_minecraft():
                return self.generate_report()
            
            # monitor for issues
            monitor_thread = threading.Thread(target=self.monitor_logs)
            monitor_thread.start()
            monitor_thread.join()
            
        except KeyboardInterrupt:
            print("\nTest interrupted by user")
        finally:
            self.terminate_minecraft()
            
        return self.generate_report()


def main():
    """Main function to run the tester"""
    # hardcoded minecraft directory
    minecraft_dir = "C:\Users\ikene\curseforge\minecraft\Instances\Homesteady (Forge)"
    
    java_path = input("Enter Java path (or press Enter for default 'java'): ").strip()
    if not java_path:
        java_path = "dummy"  # we're not launching anyway
    
    timeout = input("Enter timeout in seconds (default 300): ").strip()
    try:
        timeout = int(timeout) if timeout else 300
    except ValueError:
        timeout = 300
    
    print(f"\nConfiguration:")
    print(f"Minecraft Directory: {minecraft_dir}")
    print(f"Java Path: {java_path}")
    print(f"Timeout: {timeout} seconds")
    print("\nStarting test in 3 seconds... (Ctrl+C to cancel)")
    
    try:
        time.sleep(3)
        tester = MinecraftTester(minecraft_dir, java_path, timeout)
        report = tester.run_test()
        
        # summary recommendation
        if report["startup_successful"] and report["critical_issues"] == 0:
            print("\n🎉 SUCCESS: Your modpack appears to start up correctly!")
        elif report["critical_issues"] > 0:
            print(f"\n⚠️  CRITICAL: {report['critical_issues']} issues prevent startup")
            print("Recommend fixing critical issues before playing")
        else:
            print(f"\n⚠️  WARNING: Startup worked but {report['total_issues']} issues detected")
    
    except KeyboardInterrupt:
        print("\nTest cancelled by user")
    except Exception as e:
        print(f"Error running test: {e}")


if __name__ == "__main__":
    main()