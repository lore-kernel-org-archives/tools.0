Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658C431691C
	for <tools@linux.kernel.org>; Fri, 19 Dec 2025 18:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170483; cv=none; b=EHR/2TMaBcT2Fb3Nph4khBxYxE/yPMKh1PF55g+KhIbnwAtHx+OQrjFNx2MqjehGRa9ADh9jOge/waMmtrftaHCANjT4qmX1ki7WyDxu6Au9BWJ8OVtocHUyXAhbnwuWfE2RxcwGzDO62RtQ356jZkMNthf8fZjbVz8Sf8bofUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170483; c=relaxed/simple;
	bh=VJwepYWduMow/NbyvEXB9EPtn2vW4afwJqhdWvlL1vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEN91ZUEAb32BnwOoPgyAyJ9Ko4vkQtTRBh5OKb60A3mpktVUlaEcgOb6+GsnzQRBvrIcH+egE2VzYQ7MrW2hTx4OcCsF9VfYbYNucpyJ1RL16+xFuce8k6xxRjqaJqjvDVxs7FiJGyl4bjbOJFsRBo9/cW4mHBaJDNGlEefqq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 1B0F6C116D0; Fri, 19 Dec 2025 18:54:43 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78F2BC19422
	for <tools@kernel.org>; Fri, 19 Dec 2025 18:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 78F2BC19422
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso15600205e9.2
        for <tools@kernel.org>; Fri, 19 Dec 2025 10:54:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766170480; x=1766775280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8LfE97pRenEJbpP/VmV7Qe43H+AVlIgZ2qaWiTBY7ec=;
        b=UtWEcrEl/crliVxiSvDFEd8/0gj8BlB33kqIIM2BF26QE/nPyrkRc+6q0GUYaxf3xl
         vOabutvUycGWsyf6eb2ky9RF7cU+jP8iCqtxNNVb8LBXR14K9l0+EuskwnfrNJzBMcv7
         kGESPJhiMLyFg6R/ErDKwAG75z3CjeufTPoirLeuveK9+pepfkH37ip8noHoLXCZEs66
         bMl6mpjmoDTAAZOIZJYUxOjvmatQkNL+9OIrPVbJ5/BTLqbQI/MkauSrvZsV39bevsHo
         NCzxJY6l8orviol/WTWbzZyPpFW6V9dGUZxt5qYxQ+zLul+ZvwPNMEuleLf0lftBDHso
         f6nw==
X-Forwarded-Encrypted: i=1; AJvYcCXRHg9P7Lx8+JLuCdNYgGvmgNAzxsN2cbgfwqdz8rXDMTvi+byCY705eKK0WycQt/5hhmE6Xg==@kernel.org
X-Gm-Message-State: AOJu0YwNKdIApzLtyL7LkpPETtE4tU6X5H3kp4rdu/Dt9s7eYCsKwerh
	gnQidFcPBsQA6DweXEShx36O6f0rRxEjLD6PFbA+YE3/FF/OOjTC4I8n
X-Gm-Gg: AY/fxX6Bv59mmo5Ntgx6LAEWhqOaC/lwNCiirDl7JCmX9CrzVe+BkI+SaV5YS6lqJgB
	PMz4G2uRpvxquldO8TE6V4/aFJthCMmLadLvMLvr7fmPo05Z6hHj4HZIetJhfNnjU6H0MGFe5A/
	QDDa2spCl+K1mPZ7fgLVRXSE6sadggrR0iSvweqHxXIoXPECkc6/lSpnPNShyaEr/5DJG3P2PqH
	30ARzVjbIUPlJGzz+4peSeqBe3E9NPyCtdXH8DFxxk1X4YlZwGoPX4LOCJ2Fkfe+qSwNhyyNb3B
	deL56afYoyvEtymJSOxR6XEkgHG9XFDrAaZ/LHs8dvz8UM8KkDo72XOpfXq605z+1Gg1PPKdHFF
	aIVcWkloe4cwFX+3CKuU4ZX0SVOJdQ1lb7rhV7P9b+3tlgU4Px7xXvhfxH4B+4a0OHBUZ3FI/qe
	N3oI/uWhAIKEkzeJ6FoHDX9Sb+175rt8aHg6HT8exO6mtS+Q5bHG3mBJ5q1tdtRO+r
X-Google-Smtp-Source: AGHT+IEFXY6tJS4bzz1cJcFCNMtRvuYwH8sVbE5nQ7FeEUOeoKWDZulIiEkA0hqZJNX7YAlGVNUkdA==
X-Received: by 2002:a05:600c:46c4:b0:477:7bd2:693f with SMTP id 5b1f17b1804b1-47d1953b80bmr39723205e9.6.1766170479456;
        Fri, 19 Dec 2025 10:54:39 -0800 (PST)
Received: from bogus (host109-153-58-126.range109-153.btcentralplus.com. [109.153.58.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a210e7sm39262025e9.3.2025.12.19.10.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 10:54:38 -0800 (PST)
Date: Fri, 19 Dec 2025 18:54:37 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Linus Walleij <linusw@kernel.org>, tools@kernel.org,
	users@kernel.org
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
Message-ID: <aUWfbRAHjNI-lNOz@bogus>
References: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>
 <CAD++jLmGuPxWLEcUaVMU9jCmEfrzUbgzMrFbd9uX+62avv9jmA@mail.gmail.com>
 <20251217-yellow-cormorant-of-debate-b55a75@lemur>
 <CAPKp9uY-BYKXAoWg8zPLhQjEHs4qqsW+qjYne7Qv1LKwL6BQUA@mail.gmail.com>
 <20251218-dove-of-fantastic-upgrade-c491ea@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-dove-of-fantastic-upgrade-c491ea@lemur>

On Thu, Dec 18, 2025 at 03:47:53PM -0500, Konstantin Ryabitsev wrote:
> On Thu, Dec 18, 2025 at 06:51:34PM +0000, Sudeep Holla wrote:
> > > >   File "/home/linus/.local/lib/python3.14/site-packages/korgalore/pi_feed.py",
> > > > line 386, in feed_lock
> > > >     lockfh = open(lock_file_path, 'w')
> > > > FileNotFoundError: [Errno 2] No such file or directory:
> > > > '/home/linus/.local/share/korgalore/lkml/korgalore.lock'
> > >
> > > Ouch. Yeah, this should fix it for you while I push out a better fix:
> > >
> > >     mkdir -p /home/linus/.local/share/korgalore/lkml
> > 
> > I am facing a similar issue where kgl yank works but kgl pull fails
> > slightly in a different way.
> > I started it with kgl, version 0.2.1
> 
> Oh no, this is what happens when I don't check adding new feeds after a major
> refactor. I think it's working correctly now in 0.2.2 -- please check!
> 
Thanks for the fix. I can see the pull doesn't give any errors but it doesn't
seem to push anything to my gmail label.

The settings should be fine as yank is working just fine. Or am I missing a
step after `kgl pull` to push it.

Sorry for the big log attached below. When using `kgl pull`, I don't see
"debug: Connecting to Gmail service for linux
debug: Uploading: ...."

I have also added my config file with feed urls at the end. I have chosen
lists that I have not subscribe to in order to avoid any confusion. I did
try to yank a thread that is already in my gmail mbox, it worked correctly
by adding the label in my yank command in addition to the labels that were
already present.

-- 
Regards,
Sudeep

-->8

$kgl -v DEBUG pull
debug: Loading config from /.config/korgalore/korgalore.toml
debug: Config loaded with 1 targets, 4 deliveries, and 4 feeds
debug: Data directory: /.local/share/korgalore
debug: Mapping deliveries to their feeds and targets
debug: Resolved feed "lkml" to URL: https://lore.kernel.org/lkml
debug: Resolved feed "kvm" to URL: https://lore.kernel.org/kvm
debug: Resolved feed "br" to URL: https://lore.kernel.org/buildroot
debug: Resolved feed "mm" to URL: https://lore.kernel.org/linux-mm
debug: Acquired lock for feed '/.local/share/korgalore/lkml'.
debug: Acquired lock for feed '/.local/share/korgalore/kvm'.
debug: Acquired lock for feed '/.local/share/korgalore/buildroot'.
debug: Acquired lock for feed '/.local/share/korgalore/linux-mm'.
debug: No failed commits to retry for delivery: lkml
debug: No failed commits to retry for delivery: kvm
debug: No failed commits to retry for delivery: br
debug: No failed commits to retry for delivery: mm
debug: No failed commits to retry for any delivery.
debug: Highest local epoch: 18
debug: Running git command: git -C /.local/share/korgalore/lkml/git/18.git fetch origin --shallow-since=1.week.ago --update-shallow
debug: Running git command: git -C /.local/share/korgalore/lkml/git/18.git symbolic-ref -q HEAD
debug: Running git command: git -C /.local/share/korgalore/lkml/git/18.git rev-list -n 1 master
debug: Running git command: git -C /.local/share/korgalore/lkml/git/18.git rev-list -n 1 master
debug: Highest remote epoch: 18
debug: No new epochs detected for feed /.local/share/korgalore/lkml
debug: No new epochs found for feed: /.local/share/korgalore/kvm
debug: No new epochs found for feed: /.local/share/korgalore/buildroot
debug: Highest local epoch: 2
debug: Running git command: git -C /.local/share/korgalore/linux-mm/git/2.git fetch origin --shallow-since=1.week.ago --update-shallow
debug: Running git command: git -C /.local/share/korgalore/linux-mm/git/2.git symbolic-ref -q HEAD
debug: Running git command: git -C /.local/share/korgalore/linux-mm/git/2.git rev-list -n 1 master
debug: Running git command: git -C /.local/share/korgalore/linux-mm/git/2.git rev-list -n 1 master
debug: Highest remote epoch: 2
debug: No new epochs detected for feed /.local/share/korgalore/linux-mm
debug: Updated feeds: lkml, linux-mm
debug: Deliveries to run: lkml, mm
debug: Processing deliveries for target: linux
debug: Highest known epoch for delivery lkml: 18
debug: Running git command: git -C /.local/share/korgalore/lkml/git/18.git cat-file -e 81e8636295121b0fc8eec4b428a77f7816450d53^
debug: Running git command: git -C /.local/share/korgalore/lkml/git/18.git rev-list --reverse --ancestry-path 81e8636295121b0fc8eec4b428a77f7816450d53..HEAD
debug: Initializing new state file for delivery: mm
debug: Running git command: git -C /.local/share/korgalore/linux-mm/git/2.git rev-list -n 1 master
debug: Running git command: git -C /.local/share/korgalore/linux-mm/git/2.git show -s --format=%ci a8420ba669a277854d33fcfb070b935a2d3f58cb
debug: Running git command: git -C /.local/share/korgalore/linux-mm/git/2.git show a8420ba669a277854d33fcfb070b935a2d3f58cb:m
debug: Highest known epoch for delivery mm: 2
debug: Running git command: git -C /.local/share/korgalore/linux-mm/git/2.git cat-file -e a8420ba669a277854d33fcfb070b935a2d3f58cb^
debug: Running git command: git -C /.local/share/korgalore/linux-mm/git/2.git rev-list --reverse --ancestry-path a8420ba669a277854d33fcfb070b935a2d3f58cb..HEAD
debug: No new commits for delivery: mm
debug: Delivering 1 messages to target: linux
debug: Running git command: git -C /.local/share/korgalore/lkml/git/18.git show ba387a13f1918fbd9bf2ccdea11d5184c6c1774f:m
debug: Connecting to Gmail service for linux
debug: Running git command: git -C /.local/share/korgalore/lkml/git/18.git show ba387a13f1918fbd9bf2ccdea11d5184c6c1774f:m
debug:  -> Re: [PATCH v5 02/36] compiler-context-analysis: Add infrastructure for Context Analysis with Clang
debug: Running git command: git -C /.local/share/korgalore/lkml/git/18.git show -s --format=%ci ba387a13f1918fbd9bf2ccdea11d5184c6c1774f
debug: Running git command: git -C /.local/share/korgalore/lkml/git/18.git show ba387a13f1918fbd9bf2ccdea11d5184c6c1774f:m
debug: Released lock for feed '/.local/share/korgalore/lkml'.
debug: Released lock for feed '/.local/share/korgalore/kvm'.
debug: Released lock for feed '/.local/share/korgalore/buildroot'.
debug: Released lock for feed '/.local/share/korgalore/linux-mm'.
Pull complete with updates:
  lkml: 1

-->8

$kgl -v DEBUG yank --thread https://lore.kernel.org/buildroot/20251219175141.1907408-1-bernd@kuhls.net -l LINUX/TEST
debug: Loading config from /.config/korgalore/korgalore.toml
debug: Config loaded with 1 targets, 4 deliveries, and 4 feeds
debug: Data directory: /.local/share/korgalore
debug: No target specified, using first target: linux
debug: Fetching thread: https://lore.kernel.org/buildroot/20251219175141.1907408-1-bernd@kuhls.net
debug: Fetching thread from: https://lore.kernel.org/all/20251219175141.1907408-1-bernd@kuhls.net/t.mbox.gz
debug: Mailsplitting the mbox into /tmp/tmpz1xoy3rd-mailsplit
debug: Running git command: git mailsplit --mboxrd -o/tmp/tmpz1xoy3rd-mailsplit
debug: Parsed 23 messages from thread
Found 23 messages in thread
debug: Connecting to Gmail service for linux
debug: Uploading: [Buildroot] [PATCH v4 13/20] package/qjson: remove package
debug: Uploading: [Buildroot] [PATCH v4 02/20] package/dmraid: remove package
debug: Uploading: Re: [Buildroot] [PATCH v4 11/20] package/openpowerlink: remove package
debug: Uploading: [Buildroot] [PATCH v4 08/20] package/libiqrf: remove package
debug: Uploading: [Buildroot] [PATCH v4 00/20] Remove packages
debug: Uploading: [Buildroot] [PATCH v4 11/20] package/openpowerlink: remove package
debug: Uploading: [Buildroot] [PATCH v4 06/20] package/let-me-create: remove package
debug: Uploading: [Buildroot] [PATCH v4 12/20] package/opentracing-cpp: remove package
debug: Uploading: [Buildroot] [PATCH v4 01/20] package/libnids: remove package
debug: Uploading: [Buildroot] [PATCH v4 19/20] package/python-aioredis: remove package
debug: Uploading: [Buildroot] [PATCH v4 17/20] package/musepack: remove package
debug: Uploading: [Buildroot] [PATCH v4 04/20] package/connman-gtk: remove package
debug: Uploading: [Buildroot] [PATCH v4 10/20] package/alure: remove package
debug: Uploading: [Buildroot] [PATCH v4 18/20] package/libcuefile: remove package
debug: Uploading: [Buildroot] [PATCH v4 16/20] package/racehound: remove package
debug: Uploading: [Buildroot] [PATCH v4 05/20] package/hawktracer: remove package
debug: Uploading: [Buildroot] [PATCH v4 20/20] package/cppdb: remove package
debug: Uploading: [Buildroot] [PATCH v4 07/20] package/libcgi: remove package
debug: Uploading: [Buildroot] [PATCH v4 09/20] package/libuwsc: remove package
debug: Uploading: [Buildroot] [PATCH v4 03/20] package/libmhash: remove package
debug: Uploading: Re: [Buildroot] [PATCH v4 10/20] package/alure: remove package
debug: Uploading: [Buildroot] [PATCH v4 15/20] package/taskd: remove package
debug: Uploading: [Buildroot] [PATCH v4 14/20] package/sconeserver: remove package

-->8

.config/korgalore/korgalore.toml

### Feeds ###
[feeds.lkml]
url = 'https://lore.kernel.org/lkml'

[feeds.kvm]
url = 'https://lore.kernel.org/kvm'

[feeds.br]
url = 'https://lore.kernel.org/buildroot'

[feeds.mm]
url = 'https://lore.kernel.org/linux-mm'

### Deliveries ###

[deliveries.lkml]
feed = 'lkml'
target = 'linux'
labels = ['LINUX/LKML']

[deliveries.kvm]
feed = 'kvm'
target = 'linux'
labels = ['LINUX/TEST']

[deliveries.br]
feed = 'br'
target = 'linux'
labels = ['LINUX/TEST']

[deliveries.mm]
feed = 'mm'
target = 'linux'
labels = ['LINUX/TEST']

