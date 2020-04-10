Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web12.545.1586552460737746256
 for <tools@linux.kernel.org>;
 Fri, 10 Apr 2020 14:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O8WHunsy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.41, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f41.google.com with SMTP id o15so1571854qvl.3
        for <tools@linux.kernel.org>; Fri, 10 Apr 2020 14:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=7a1g+haNftVjirEC+h90qeg8V27QSE7yfhZcovv/SU8=;
        b=O8WHunsy2kJnKxjy0GmPksuA44aooCAGwpR6px6rMh6kyfZsi0csiSktNGuwyDkN7y
         DNxmE0XgVWIyhvBhBvwqCh9WMtPxRceiBkaPsdwT0MpkxnoJ85aARZJcn4Aib3j17c8A
         CtlAxjgpPSqOMudIdPMdtN61yACpbOW0rVI0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=7a1g+haNftVjirEC+h90qeg8V27QSE7yfhZcovv/SU8=;
        b=IIbT/HBXTMVizfXZ5qWvEKzq6qD1SY2O3AzRteGcLLY2nTgXb5n3m5rQPXqFx919RX
         lrz49ZHp0knIUMBMtuep0BYJcsaDSQmB5xAwqrwTtCAuTSwm2neGtiqpCrKXxqKKNjWT
         RrEJ4X/w8bvsZQOMNyFiS+5GEGkNr88DjP0114ZIOgD2HVZMZrytXaIZGc3WiWxMWatg
         z23piaH4EkIk/XzEV59xqpFJd6gnJae45K06oWitoWf+Wfnje4ELNtbawnNXiHOwcg7V
         ju5RX5gGP6GCNz7b6g021ZCMm6K+5k8Uqgi9KGDdes6XtpWKacXLRVuZVq2j3EHar7LK
         MLIA==
X-Gm-Message-State: AGi0PuZcG7+Acvvqv072AhkdnErsIt1iM6t2/MxWdA8VnsEiFrQfi2rH
	jpiK/tZIIRW2tA59+spCVrVUvWdRLP8=
X-Google-Smtp-Source: APiQypImUeIUhvSysgB2JDPlLo0Wt1Vlf+lCRmKDor5dT2xL7tho6UC11r/KEQ3N47OFvtZ2enPOEg==
X-Received: by 2002:ad4:4c85:: with SMTP id bs5mr6960653qvb.213.1586552459340;
        Fri, 10 Apr 2020 14:00:59 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id m11sm2359951qkg.130.2020.04.10.14.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 14:00:58 -0700 (PDT)
Date: Fri, 10 Apr 2020 17:00:56 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Cc: users@linux.kernel.org
Subject: b4 auto-thankanator landed in master
Message-ID: <20200410210056.wefp3ujj22esoy2r@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi, all:

Based on your feedback, I added an "auto-thankanator" mode to b4, which 
will track your use of "b4 am" and "b4 pr" and create convenient 
templated thank-you replies when you run "b4 ty".

Here's a screencast with a hands-on example:
https://asciinema.org/a/318493

I also have another example below.

Since it's an experimental feature, we just save a .thanks file instead 
of sending it outright -- at least until there's a lot more testing.  
However, if you have git-send-email set up, you can easily send that 
.thanks file off:

git send-email *.thanks

You can just hit "enter" for the questions git-send-email will try to 
ask you, as all addressee information will be taken from the message 
itself.

You can also list all tracked series and pull requests using:
b4 ty -l

They can be deleted or sent manually using "b4 ty -d" and "b4 ty -s" 
respectively (some sanity checking will be done before sending).

Please also see "b4 ty --help" for other flags.

I'd like to hear your feedback on how this feature can be improved.  
Similarly, it's possible that "b4 pr" workflow does not match how most 
people use it, so I would greatly appreciate any feedback on how that 
feature can be improved as well.

If you would like to test these features out, the repository is here:
https://git.kernel.org/pub/scm/utils/b4/b4.git/

There's probably lots of bugs in "b4 ty", but "b4 am" should be stable 
enough for daily use.

Best regards,
-K

---

Inline example:

$ b4 am -o/tmp 20200408152151.5780-1-christian.brauner@ubuntu.com
Looking up https://lore.kernel.org/r/20200408152151.5780-1-christian.brauner@ubuntu.com
Grabbing thread from lore.kernel.org
Analyzing 16 messages in the thread
---
Writing /tmp/20200408_christian_brauner_loopfs.mbx
  [✓] [PATCH 1/8] kobject_uevent: remove unneeded netlink_ns check
  [✓] [PATCH 2/8] loopfs: implement loopfs
  [✓] [PATCH 3/8] loop: use ns_capable for some loop operations
  [✓] [PATCH 4/8] kernfs: handle multiple namespace tags
  [✓] [PATCH 5/8] kernfs: let objects opt-in to propagating from the initial namespace
  [✓] [PATCH 6/8] genhd: add minimal namespace infrastructure
  [✓] [PATCH 7/8] loopfs: start attaching correct namespace during loop_add()
  [✓] [PATCH 8/8] loopfs: only show devices in their correct instance
  ---
  [✓] Attestation-by: Christian Brauner <christian.brauner@ubuntu.com> (pgp: 91C61BC06578DCA2)
---
Total patches: 8
---
Cover: /tmp/20200408_christian_brauner_loopfs.cover
 Link: https://lore.kernel.org/r/20200408152151.5780-1-christian.brauner@ubuntu.com
 Base: 7111951b8d4973bda27ff663f2cf18b663d15b48
       git checkout -b 20200408_christian_brauner_ubuntu_com 7111951b8d4973bda27ff663f2cf18b663d15b48
       git am /tmp/20200408_christian_brauner_loopfs.mbx

$ git checkout -o loopfs 7111951b8d4973bda27ff663f2cf18b663d15b48
$ git am /tmp/20200408_christian_brauner_loopfs.mbx
$ (hack-hack-hack, review-review-review)
$ git checkout master
$ git merge loopfs master --signoff

If you made no changes to the patch contents at all, you can run
"b4 ty --auto" to find that patch series in the current branch:

$ b4 ty --auto
Auto-thankanating commits in master
Found 10 of your commits since 1.week
Calculating patch hashes, may take a moment...
  Located: [PATCH 0/8] loopfs
---
Generating 1 thank-you letters
  Writing: ./christian_brauner_ubuntu_com_patch_0_8_loopfs.thanks
---
You can now run:
  git send-email ./*.thanks

The contents of christian_brauner_ubuntu_com_patch_0_8_loopfs.thanks are:

----
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: [skipped]
Cc: [skipped]
In-Reply-To: <20200408152151.5780-1-christian.brauner@ubuntu.com>
References: <20200408152151.5780-1-christian.brauner@ubuntu.com>
Subject: Re: [PATCH 0/8] loopfs
Message-Id: <158655148980.3824973.6760061710410126169.b4-ty@linuxfoundation.org>

On Wed, 8 Apr 2020 17:21:43 +0200, Christian Brauner wrote:
> Hey everyone,
> 
> After having been pinged about this by various people recently here's loopfs.
> 
> This implements loopfs, a loop device filesystem. It takes inspiration
> from the binderfs filesystem I implemented about two years ago and with
> which we had overall good experiences so far. Parts of it are also
> based on [3] but it's mostly a new, imho cleaner and more complete
> approach.
> 
> [...]

Applied, thanks!

- kobject_uevent: remove unneeded netlink_ns check
  https://git.kernel.org/mricon/c/d8f4e1e096
- loopfs: implement loopfs
  https://git.kernel.org/mricon/c/e022b26012
- loop: use ns_capable for some loop operations
  https://git.kernel.org/mricon/c/a45ab6b63c
- kernfs: handle multiple namespace tags
  https://git.kernel.org/mricon/c/9ea3d700d0
- kernfs: let objects opt-in to propagating from the initial namespace
  https://git.kernel.org/mricon/c/50b98ec6f6
- genhd: add minimal namespace infrastructure
  https://git.kernel.org/mricon/c/d01bc5a1a6
- loopfs: start attaching correct namespace during loop_add()
  https://git.kernel.org/mricon/c/be02c77ba6
- loopfs: only show devices in their correct instance
  https://git.kernel.org/mricon/c/b5cce3ce8f

Best regards,
--
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
----

