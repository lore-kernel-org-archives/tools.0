Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.155.1585261172938374101
 for <tools@linux.kernel.org>;
 Thu, 26 Mar 2020 15:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gfftMwuk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id a81so9893708wmf.5
        for <tools@linux.kernel.org>; Thu, 26 Mar 2020 15:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=bKV5LDmPRS4jCXALae7L8UjOBzxhLxI3M/HhJoxenkU=;
        b=gfftMwukkP1p69pYJmqp+SeL5KfsN6ECXvmNu64QYctG5rUDGTARifD/uSwgrhRFVx
         /7uYgZEaqruko+UWfIYl1tla2Z4/G0U24hbjflJOMD54y8q9aVvh9JYWYl498NGLW8EL
         q1gzQK25sWMzg4RFNTLRBtEzeORFZuxv33/Ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=bKV5LDmPRS4jCXALae7L8UjOBzxhLxI3M/HhJoxenkU=;
        b=oK2WJjFEqaYIF6dfOfu105c6znr2LlFIVR+nqsobn78NWjiJONmJ8U6PCd/TWa8rTm
         QmG73Sj4lfBqHVXHMRFc6Z15ksH3WUH9KGwYO/fF7RydvUH3kYKEpl4vVcXhgyeHDdj7
         odn2fJiGfe+hfrscngYWcd4+DsxBE3GHOQTAEWD2HtMO/rMD6Cjob/Y4bo5/Maa6CAR1
         AqAoa3bg32TEnUkee56uC2H/67L10unZNKvaqUf5NNAwqSUHOEpOsSnfBkMFxkRDJXDI
         vEyAXzYeU1H6zLXfX7UDj/v95m1HQM4pQhzsAcpb25TfIUtX6axCusKa+gx2KJ0EboN2
         P+hg==
X-Gm-Message-State: ANhLgQ17AXy820EsLCO3ezY4iRvtaSzEhoFfxc1N4+7+vis9ru7WCP+V
	OiNzRnUlFvd2GIcKhbKk5oEpWw==
X-Google-Smtp-Source: ADFU+vs0ZTFNVQn8TeODmd6VYNdaCXMk6Xr8jAymOEixIFatYc5PsyJuoLABnZc0TKiFcRzyN/Fcqg==
X-Received: by 2002:a5d:53ce:: with SMTP id a14mr612511wrw.129.1585261171034;
        Thu, 26 Mar 2020 15:19:31 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (174.ip-51-79-86.net. [51.79.86.174])
        by smtp.gmail.com with ESMTPSA id h18sm5102003wmm.34.2020.03.26.15.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 15:19:30 -0700 (PDT)
Date: Thu, 26 Mar 2020 18:19:26 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: b4 can now explode a pull request into an mbox file with patches
Message-ID: <20200326221926.jfsbtvnb7bfjahov@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

While working on "pull-request exploder" stuff for achiving on 
lore.kernel.org, I realized that this may be a useful set of features 
for developers as well, as I imagine you sometimes want to comment on 
something in a pull request and end up having to go hunting for the 
proper commit, from/to/cc, etc information.

So, the master branch of b4 just landed initial "b4 pr" implementation, 
which will let you do "b4 pr --explode <msgid>" to get an mbox file
with that pull request converted into a patch series with various 
headers set so it's convenient to fire off "mutt -f" and reply to the 
exact bits that you want and send it to the proper places.

In more details:

b4 pr <msgid>

  - downloads that message
  - parses the pull request
  - checks that the remote tip is where the message says it should be
  - makes sure the base-commit is present in the tree
  - makes sure the tip commit isn't already in one of the branches
  - checks if FETCH_HEAD already is at that commit
  - if all looks good, performs a git fetch
  - (optionally, can then do a checkout into a branch for you)

b4 pr --check <msgid>

  Runs all of the checks above, but doesn't perform the actual fetch.
  Useful if you don't remember if you've already processed a pull
  request or not.

b4 pr --explode <msgid>

  Runs basic sanity checks and then:

  - performs a git fetch
  - runs a "git format-patch" for base-commit..FETCH_HEAD
  - adds the same to/from/cc headers as in the pull request
  - properly threads each patch below the pull request
  - saves that into a <msgid>.mbox file

I mostly imagine that it's the --explode functionality that you'd be 
interested in, but since that required writing most of the other 
pull-request handling functionality, there's basic handling for that as 
well.

Please let me know if that is useful.

You can grab the master here:
https://git.kernel.org/pub/scm/utils/b4/b4.git

Using the "b4.sh" wrapper in should let you run it straight from the 
checkout.

-K
