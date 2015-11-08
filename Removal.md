<h1>Removal</h1>

<h2>Instructions for uninstalling Schema Validator on different platforms.</h2>

<h3>Windows Installer</h3>
<ul>
    <li>Open Control Panel</li>
    <li>Open &quot;Add or Remove Programs&quot;</li>
    <li>Click on the &quot;XmlSoft - Schema Validator&quot; entry and press it&#x27;s Remove button.</li>
    <li>Follow the directions within the resulting uninstallation guide.</li>
</ul>

<h3>Linux Package - GUI</h3>
<ul>
    <li>Navigate to System / Administration / Synaptic Package Manager.</li>
    <li>Enter your root password when prompted.</li>
    <li>In the quick search bar type &quot;schema-validator&quot;.</li>
    <li>Right click on the Schema Validator entry and click on the &quot;Mark for Complete Removal&quot; option.</li>
    <li>Click the Apply button, click Apply in the resulting dialog and close the following dialogs.</li>
    <li>Close the Synaptic Package Manager.</li>
</ul>

<h3>Linux Package - Command Line</h3>
<ul>
    <li>Open a shell and type &quot;sudo dpkg -P schema-validator&quot; and click enter.</li>
</ul>

<h3>OSX (delayed)</h3>

<h3>Source for Windows:</h3>
<ul>
    <li>Delete the &quot;C:\Program Files\schema-validator&quot; directory and any links that you may have created which point to any of those files.</li>
</ul>

<h3>Source for Unix</h3>
<ul>
    <li>Download &quot;schema-validator-1.0.2.tar.gz&quot;.</li>
    <li>Uncompress &quot;schema-validator-1.0.2.tar.gz&quot; into the directory &quot;schema-validator-1.0.2&quot;.</li>
    <li>Open a shell and navigate to the &quot;schema-validator-1.0.2&quot; directory.</li>
    <li>Type &quot;qmake&quot;.  This will create the makefile for your system.</li>
    <li>Type &quot;sudo make uninstall&quot;.  This will remove Schema Validator and it&#x27;s associated files from your system.</li>
</ul>
