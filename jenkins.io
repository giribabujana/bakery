(If your IDE supports compile-on-save mode this is especially convenient since each `hpi:run` will pick up compiled changes without needing to run to `package` phase.)

You can also run the Docker demo with snapshot binaries, after (re-)building one or more component plugins using `mvn -DskipTests clean install`:
You can also run the basic Docker demo with snapshot binaries:

    make -C workflow-aggregator-plugin/demo run-snapshot
* (re-)build one or more component plugins using `mvn -DskipTests clean install`
* specify a `2.x-SNAPSHOT` version in `workflow-aggregator-plugin/demo/plugins.txt`
* run: `make -C workflow-aggregator-plugin/demo run`

(A similar procedure works for other Docker-based demos, such as in `github-branch-source-plugin`.)

The snapshot Docker demo is mainly useful for verifying the effect of ongoing changes on future demo binary releases.
You get the `cd` sample job set up, but your environment is thrown away if you kill the Docker container (for example with Ctrl-C).
  64  README.md 
@@ -2,55 +2,11 @@

Building continuous delivery pipelines and similarly complex tasks in Jenkins using freestyle projects and traditional plugins can be awkward.
You need to mix Parameterized Trigger, Copy Artifact, Promoted Builds, Conditional Build Step, and more just to express what should be a simple script.
The Pipeline plugin (formerly known as Workflow) suite attempts to make it possible to directly write that script, what people often call a _pipeline_, while integrating with Jenkins features like slaves and publishers.
The Pipeline plugin (formerly known as Workflow) suite attempts to make it possible to directly write that script, what people often call a _pipeline_, while integrating with Jenkins features like agents and publishers.

# Features
# Documentation

## Scripted control flow

Your whole pipeline is a single Groovy script using an embedded DSL, possibly quite short and legible; there is no need to jump between multiple job configuration screens to see what is going on.
Conditions, loops, variables, parallel tasks, and so on are defined using regular language constructs.
At any point you can insert a shell/batch script to do “real work” (compilation, etc.).

## Useful steps

Standard DSL functions (“steps”) let you run external processes, grab slave nodes and workspaces, perform SCM checkouts, build other projects (pipeline or freestyle), wait for external conditions, and so on.
Plugins can add further steps.

## Pause and resume execution

If Jenkins is restarted (intentionally, or because of a crash) while your Pipeline is running, when it comes back up, execution is resumed where it left off.
This applies to external processes (shell scripts) so long as the slave can be reattached, and losing the slave connection temporarily is not fatal either.

Pipelines can pause in the middle and wait for a human to approve something, or enter some information.
Executors need not be consumed while the Pipeline is waiting.

## Pipeline stages

Pipelines can be divided into sequential stages, not only for labeling but to throttle concurrency.

# Getting started

Read the [tutorial](TUTORIAL.md) to get started writing pipelines.

There is also a [DZone Refcard](https://dzone.com/refcardz/continuous-delivery-with-jenkins-workflow).

A new collection of [examples, snippets, tips, and tricks](https://github.com/jenkinsci/pipeline-examples) is in progress.

# Installation

Releases are available on the Jenkins update center.
You need to be running a sufficiently recent Jenkins release: an LTS in the 1.580.x line or newer (currently 1.642.x for the latest updates), or a weekly release.

For Jenkins 2.x users, _Pipeline_ is selected by default in the setup wizard.
If you did not pick it, or are running Jenkins 1.x, install _Pipeline_ (its dependencies will be pulled in automatically);
you will need to restart Jenkins to complete installation.

CloudBees Jenkins Enterprise users get Pipeline automatically as of the 14.11 (1.580.1.1) release.
Otherwise install _CloudBees Pipeline_ from the update center.
Again dependencies will be pulled in automatically, including all the OSS plugins.

For multibranch pipelines and organization folders, install _Pipeline: Multibranch_ (included as of _Pipeline_ 2.0) plus at least one SCM provider, such as _GitHub Branch Source_.
See the [official documentation on jenkins.io](https://jenkins.io/doc/book/pipeline/).

# News & questions

@@ -61,19 +17,7 @@ For multibranch pipelines and organization folders, install _Pipeline: Multibran

# Demo

See the [demo overview](https://github.com/jenkinsci/workflow-aggregator-plugin/blob/master/demo/README.md) using Docker if you want to try a complete setup quickly. In short:

    docker run -p 8080:8080 -p 8081:8081 -p 8022:22 -ti jenkinsci/workflow-demo

and browse [localhost:8080](http://localhost:8080/).

# Presentations

_Directions for Pipeline_ (JW Sep 2016): [slides and video](https://www.cloudbees.com/directions-pipeline)

Webinar _Continuous Delivery as Code with Jenkins Workflow_ (Sep 2015): [slides](https://www.cloudbees.com/sites/default/files/webinar-_continuous_delivery_as_code_with_jenkins_workflow.pdf) and [video](https://youtu.be/Q2pZdzaaCXg) (demo starts at 20:30)

Jenkins Workflow: What’s Up? (JUC West) (Sep 2015): [slides](http://www.slideshare.net/jgcloudbees/juc-west-15-jenkins-workflow-whats-up) and [video](https://youtu.be/VkIzoU7zYzE)
See the [demo overview](https://github.com/jenkinsci/workflow-aggregator-plugin/blob/master/demo/README.md) using Docker if you want to try a complete setup quickly.

# Development
