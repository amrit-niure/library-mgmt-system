#!/usr/bin/env python3

# Simple test script to check if markdown rendering works
import os
import sys

# Add the Django project to Python path
project_dir = r"c:\Users\Acer\Desktop\Charles Darwin University\S2 2025\PRT582 Software Engineerin Process and Tools\resources\LIBRARY MANAGEMENT SYSTEM\TechVidvanLibrary"
sys.path.append(project_dir)

try:
    import markdown
    print("✓ Markdown module is available")
    
    # Test reading README file
    readme_path = os.path.join(project_dir, 'README.md')
    print(f"Looking for README at: {readme_path}")
    print(f"File exists: {os.path.exists(readme_path)}")
    
    if os.path.exists(readme_path):
        with open(readme_path, 'r', encoding='utf-8') as file:
            content = file.read()
            print(f"✓ README file read successfully, length: {len(content)} characters")
            print(f"First 100 characters: {content[:100]}...")
            
            # Test markdown conversion
            html = markdown.markdown(content, extensions=['toc', 'fenced_code', 'tables'])
            print(f"✓ Markdown converted to HTML, length: {len(html)} characters")
            print(f"First 100 characters of HTML: {html[:100]}...")
    else:
        print("✗ README file not found")
        
except ImportError as e:
    print(f"✗ Markdown module not found: {e}")
    print("Run: pip install markdown")
except Exception as e:
    print(f"✗ Error: {e}")

print("\n=== Next Steps ===")
print("1. Make sure markdown is installed: pip install markdown")
print("2. Start Django server: python manage.py runserver")
print("3. Visit: http://127.0.0.1:8000/project-plan/")
