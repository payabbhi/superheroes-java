# Superheroes - A tutorial to enable Payments acceptance via Payabbhi Java library

Superheroes Store allows purchase of a superhero, to run errands for you, by paying a random amount between ₹1 to ₹5.

The `Payments Acceptance workflow` is implemented as described in the Payabbhi [Integration Guide](https://payabbhi.com/docs/integration) using `Payabbhi Java Library`.

The Superheroes tutorial is designed to take you to full implementation in four graded steps:
- Step 1 : Basic implementation of `Payments Acceptance workflow`
- Step 2 : Add `Payment Response Handling`
- Step 3 : Add `Exception Handling`
- Step 4 : Reorganize and Refactor to bring everything together

## Getting started

* Clone the Superheroes repository
* Install the [Payabbhi Java library](https://github.com/payabbhi/payabbhi-java)
* Sign up for a Payabbhi account and download API Keys
* Set up local env for running Superheroes

### Clone the Superheroes repository

```
 $ git clone https://github.com/payabbhi/superheroes-java.git
```

### Install the Payabbhi Java Client library

First install the [Payabbhi Java library](https://github.com/payabbhi/payabbhi-java)
as per instructions provided with it for Maven or Gradle.

#### Manual Download

An alternative is to manually download the JAR for [Payabbhi Java Library from Maven repository](http://central.maven.org/maven2/com/payabbhi/payabbhi-java/1.0.0/payabbhi-java-1.0.0.jar)

#### Dependencies

Payabbhi Java libraries has the following dependencies which should be included separately:
* [commons-codec](http://central.maven.org/maven2/commons-codec/commons-codec/1.11/commons-codec-1.11.jar)
* [json](http://central.maven.org/maven2/org/json/json/20180130/json-20180130.jar)
* [okHttp](http://central.maven.org/maven2/com/squareup/okhttp3/okhttp/3.10.0/okhttp-3.10.0.jar)
* [okio](http://central.maven.org/maven2/com/squareup/okio/okio/1.14.0/okio-1.14.0.jar)

### Sign up for a Payabbhi account and download API Keys

Next, sign up for a [Payabbhi Account](https://payabbhi.com/docs/account) and download the [API keys](https://payabbhi.com/docs/account/#api-keys) from the [Portal](https://payabbhi.com/portal).

As you go through the tutorial, you will need to replace `<ACCESS-ID>` and `<SECRET-KEY>` in **UserDetails.java** file with your actual keys. You would typically want to use your `test mode API` keys for this tutorial.

### Running Superheroes

##### Prerequisites for Steps below
  - [Tomcat Server](http://tomcat.apache.org/)
  - Eclipse (Photon Release) as IDE
  - Manually download [Payabbhi Java Library from Maven repository](http://central.maven.org/maven2/com/payabbhi/payabbhi-java/1.0.0/payabbhi-java-1.0.0.jar)
  - Manually download dependencies jar mentioned above.

##### Steps
  1. Import Superhero Project - either [custom](https://payabbhi.com/docs/checkout/#custom-checkout) or [dropin](https://payabbhi.com/docs/checkout/#drop-in-checkout).

  2. Add Tomcat Server to Eclipse Project
    + Eclipse > Preferences > Search "Server" > Select Runtime Environments > Click on Add > Select Tomcat Server under Apache section (Make sure checkbox titled 'Create New Local Server' is checked) > Next > Provide the installation directory of Tomcat > Finish > Apply & Close

  3. Make Project a Dynamic Web Project
    + Select the Imported project > Properties > Search 'Project Facets' > Select 'Dynamic Web Module'.

  4. Select Apache Server in 'Targeted Runtimes'
    + Select Project > Properties > Search 'Targeted Runtimes' > Select Apache Server.

  5. Add JAR files for Payabbhi and dependencies to Tomcat CLASSPATH
    + Add jars to `/superheroes-java/dropin/WebContent/WEB-INF/lib` or `/superheroes-java/custom/WebContent/WEB-INF/lib`

  6. Add JAR files to Project CLASSPATH
    + Select Project > Properties > Select Java Build Path > Select libraries > Add external jars > Navigate to jars and Add > Apply and Close.
  7. Deploy the App
    + Select Project > Run As -> Run on Server
  8. Open Superheroes in your browser e.g.

* http://localhost:8080/dropin/
* http://localhost:8080/dropin/step1
* http://localhost:8080/dropin/step2
* http://localhost:8080/dropin/step3
* http://localhost:8080/dropin/step4
* http://localhost:8080/custom/
* http://localhost:8080/custom/step1
* http://localhost:8080/custom/step2
* http://localhost:8080/custom/step3
* http://localhost:8080/custom/step4
