Pbcopy Vagrant
==============

Copy text from inside a vagrant box onto your host's clipboard.

### Intro

This tool is probably terrible. It's pretty convoluted and very user 
un-friendly. For these reasons I highly recommend you read the how
it works section so you can debug the various errors you could
encounter when setting this up.

Intended use:

    ```
    cat README.md | copy
    ```

### How it Works

This project includes a flask app that looks for requests on port 5050. It 
reads the "c" arg from the querystring and passes that to pbcopy. On the other
end of this we include a "copy" command that reads from stdin and curls localhost.

That was a bit confusing so this is how the whole flow looks. In vagrant you
run the command `echo "foo" | copy` the `copy` script reads "foo" from stdin.
It then curls "localhost:5050/c=foo". Then the flask server handles this
request. The flask server sees that what you want in your clipboard is 
"foo". It then calls `echo "foo" | pbcopy` and "foo" is now in your clipboard

### Additional Dependencies

This assumes that you have ~/.bin on your PATH
```bash
export PATH="$HOME/.bin:$PATH"  
```

It also assumes that you forward port 5050 from host to guest

```bash
vagrant ssh -- -R 5050:localhost:5050
```

### Getting Started

Clone this repo onto your host and run `make install` and then `make run`

Then clone this repo onto the guest and run `make install`

You're good to go! Try `cat ~/.bashrc | copy`
