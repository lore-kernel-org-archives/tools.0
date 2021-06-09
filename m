Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1905129CA
	for <tools@linux.kernel.org>; Wed,  9 Jun 2021 15:43:55 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id g12so13001961qvx.12
        for <tools@linux.kernel.org>; Wed, 09 Jun 2021 08:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Wz1qRlqwsMOrVMb7M8k8KKGihORf85fZ5+wLgLsrmN8=;
        b=RENOp85Nl4Eh45W1L5GFNZZy6cnjkBDnXfgGia9CpxQyIiN2MrKJtyIyH8vfyFSE/H
         nqDf8TJBQI1Twq5Qq8Whzs0uSix85ZS7o9pSt53Kn6IW6t18BnrS7EiIFlXitDU1BCO9
         K4Gm9NVa29pb/MNZAJyDenfjnqvhmGv68QmQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Wz1qRlqwsMOrVMb7M8k8KKGihORf85fZ5+wLgLsrmN8=;
        b=qNktATJDLFPJ1FwaOPgHQSnCakoxuRYliB47eeqwyUNEuDkYdxvBfwLe6gMiGSJtto
         CgjJF890S3+Rd+buYQNpLonT6t6gPLlFnPIlqSCzjrpAQHshAuPuFwWN4RvQ5CnCdT5/
         twzqjXyKhobbsMjQWuelMRNPgGgrSTgf+HxivuBBB1z4eQHp+sJqcicMjsN2NukodZyK
         kjIk/3ylZjMU8KCr75VBLojwuQkWWLQb+etss8mfZdunytkAXv43ligjt101DEFbhGnx
         32BIczbTfivd/U94zP3MYWKqQ4asgUwyO1Jfv4/Fx6lBb46AxtmFDeEK9UJkz7viDqtM
         b8lA==
X-Gm-Message-State: AOAM533letbCrBzGkzZcGc6oNEE13hGXUhVgZnBWvPoUOhwQd8aBPzcJ
	ElhgP9il50CHWI9DMSwQKBRQnQ==
X-Google-Smtp-Source: ABdhPJxcopXIYPRnboIMdZOHcCeu7hLesqoeVtFDhAQoFqZF0FC6IPu4VDINiBRvyKhoNVGz0V/qJA==
X-Received: by 2002:ad4:5ec7:: with SMTP id jm7mr624754qvb.11.1623253434863;
        Wed, 09 Jun 2021 08:43:54 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id f8sm260398qko.131.2021.06.09.08.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 08:43:53 -0700 (PDT)
Date: Wed, 9 Jun 2021 11:43:51 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Greg KH <greg@kroah.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 crash when trying to apply patches with latest version from
 git
Message-ID: <20210609154351.gl66xtd2bcb2prv2@nitro.local>
References: <YMB3XJ/NgtCO+YCx@kroah.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YMB3XJ/NgtCO+YCx@kroah.com>

On Wed, Jun 09, 2021 at 10:10:04AM +0200, Greg KH wrote:
> On the latest version of b4 from git, a06304fcd63f ("Perform an encoding
> bug avoidance dance"), I get the following traceback:
> 
> Looking up https://lore.kernel.org/r/20210607170054.220975-1-rui.silva%40linaro.org
> Analyzing 3 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>   ✓ [PATCH v3] MAINTAINERS: usb: add entry for isp1760
>     + Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (✓ DKIM/ideasonboard.com)
>   ---
>   ✓ Signed: DKIM/linaro.org
> Traceback (most recent call last):
>   File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 259, in <module>
>     cmd()
>   File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 242, in cmd
>     cmdargs.func(cmdargs)
>   File "/mnt/fast_disk/linux/tools/b4/b4/command.py", line 51, in cmd_am
>     b4.mbox.main(cmdargs)
>   File "/mnt/fast_disk/linux/tools/b4/b4/mbox.py", line 598, in main
>     make_am(msgs, cmdargs, msgid)
>   File "/mnt/fast_disk/linux/tools/b4/b4/mbox.py", line 133, in make_am
>     b4.save_git_am_mbox([x[1] for x in am_msgs], sys.stdout.buffer)
>   File "/mnt/fast_disk/linux/tools/b4/b4/mbox.py", line 133, in <listcomp>
>     b4.save_git_am_mbox([x[1] for x in am_msgs], sys.stdout.buffer)
>   File "/usr/lib/python3.9/email/message.py", line 391, in __getitem__
>     return self.get(name)
>   File "/usr/lib/python3.9/email/message.py", line 468, in get
>     name = name.lower()
> AttributeError: 'int' object has no attribute 'lower'
> 
> 
> Any thoughts?

Thank you, this is fixed in master now.

-K
