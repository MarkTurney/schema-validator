<h1>Installation</h1>

<h2>Instructions for installing Schema Validator on different platforms.</h2>

<h3>Windows</h3>
<ul>
    <li>Download &quot;schema-validator-1.0.2-installer.exe &quot;.</li>
    <li>Double click the schema-validator-1.0.2-installer.exe  file and follow the installation guide.</li>
</ul>
<h3>Linux Package - GUI (Lucid and above - Qt 4.6 or greater required)</h3>
<ul>
    <li>Download the .deb package for your architecture.  For example: schema-validator_1.0.2-1_amd64.deb is the .deb for x86-64 machines.</li>
    <li>Double click on the .deb package and the &quot;Package Installer&quot; dialog will appear.</li>
    <li>Click the &quot;Install Package&quot; button.</li>
    <li>Enter your root password when prompted.</li>
    <li>Close the &quot;Installation finished&quot; and &quot;Package Installer&quot; dialogs.</li>
</ul>

<p>Note: If you experience any problems installing the debian package, you will need to install from source.</p>

<h3>Linux Package - Command Line (Lucid and above - Qt 4.6 or greater required)</h3>
<ul>
    <li>Download the .deb package for your architecture. For example schema-validator_1.0.2-1_amd64.deb is the .deb for amd64 machines.</li>
    <li>Open a shell and navigate to the directory containing the .deb file.</li>
    <li>Type sudo dpkg -i followed by the name of the .deb. For example: sudo dpkg -i schema-validator_1.0.1-1_amd64.deb</li>
</ul>

<p>Note: If you experience any problems installing the debian package, you will need to install from source.</p>

<h3>From Source (Windows)</h3>
<ul>
    <li>Download and install the Qt framework (4.6 or higher) for Windows from: <a href="http://www.qt.io/download" rel="nofollow">http://www.qt.io/download</a></li>
    <li>Ensure that the Qt bin directory (Qt/20xx/qt/bin) and the Qt Mingw bin directory (Qt/20xx/mingw/bin) is in your PATH environment variable.</li>
    <li>Download &quot;schema-validator-1.0.2.tar.gz &quot;.</li>
    <li>Uncompress &quot;schema-validator-1.0.2.tar.gz &quot; into the directory &quot;schema-validator-1.0.2&quot;.</li>
    <li>Open a command prompt and navigate to this directory.</li>
    <li>Type &quot;qmake&quot;.  This will create the makefile for your system.</li>
    <li>Type &quot;mingw32-make release install&quot;.  This will compile and install Schema Validator to &quot;C:/Program Files/schema-validator&quot;.</li>
    <li>Make a link from the executable &quot;schema-validator.exe&quot; in the installation directory to your desktop.</li>
</ul>

<h3>From Source (Unix)</h3>
<ul>
    <li>If qt4-dev-tools version 4.6 or greater is available for your platform, install it. Otherwise, follow the next two steps and download it from Nokia themselves.</li>
    <li>Download and install the Qt framework (4.6 or higher) for your OS from: <a href="http://www.qt.io/download" rel="nofollow">http://www.qt.io/download</a></li>
    <li>Ensure that the Qt bin directory (Qt/20xx/qt/bin) is in your PATH environment variable.</li>
    <li>Install a compilation toolchain (build-essential on linux).</li>
    <li>Download &quot;schema-validator-1.0.2.tar.gz &quot;.</li>
    <li>Uncompress &quot;schema-validator-1.0.2.tar.gz &quot; into the directory &quot;schema-validator-1.0.2&quot;.</li>
    <li>Open a shell and navigate to the &quot;schema-validator-1.0.2&quot; directory.</li>
    <li>Type &quot;qmake&quot;.  This will create the makefile for your system.</li>
    <li>Type &quot;sudo make install&quot;.  This will build and install Schema Validator on your system.</li>
</ul>
