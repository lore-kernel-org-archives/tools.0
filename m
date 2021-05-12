Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755E271
	for <tools@linux.kernel.org>; Wed, 12 May 2021 20:56:14 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id k10so4749728qtp.9
        for <tools@linux.kernel.org>; Wed, 12 May 2021 13:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mail-followup-to:mime-version
         :content-disposition;
        bh=ZfOdKJlWnp9oNcXebh5Ez4eBsYvQFKulEI9BQecm7Dc=;
        b=Bi50viPoJaCqLv2gJcyJ4aLj3/44IdfWwjKLqtYrX7+jE3zU2VMRIX7uJ5WU42M6n5
         NswF9Z3PrpITmAoueyBd4zICI2oUVZ1vkExJX7i/jTazNwWO065DJLLJ6c+KCMZkeBi8
         Duckwf1J1UpRyfBR42rs7R0oz4dG018rHw6HY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
         :mime-version:content-disposition;
        bh=ZfOdKJlWnp9oNcXebh5Ez4eBsYvQFKulEI9BQecm7Dc=;
        b=g1U4CW3Lp+OwuLoJQ7BdIWfUD25xfTjaDWDnnwJc/eQBxBBv25GR7dyn21MHszMQGj
         4uWkW0Bp8W7ZLiEZV2Z0EAyXBC7UmaXCJiZP3SGrCXFx8XcMI6O5GohG92UC61BVMftI
         /rDD8ExIxWuu2tMPrFvp4JxkJz5oYMmmLfpdUu8V9AX54t9ITrN8LSkTHaEitJewOtiV
         cB8zRADwNZMhwlEctPcMEN3XYqfaOoM3Kxx1Js4IqHY3/wDna4oWxhvg+BMHSnt7iHeB
         Jafgrq71suVHBW46P7SlrHtW3gsUcxr4LUx15Ja5uAVNvWcfc76RxxOKhYMAgrGV9JSZ
         MOeA==
X-Gm-Message-State: AOAM532irmc++u99HSGX4KWlCEvNocAm3jU32KpOAky+wCq1Wpl7iNTF
	v8HKi8AbDGvb2hHuhz/0jnXePRDMdbF+XgRb
X-Google-Smtp-Source: ABdhPJypWucTJZKRJnZ7yyOpjribtdcCE9U9A3+sKT7kJZCpuXvH1x7myC6mQhnSiax/ZFwtSGlk0A==
X-Received: by 2002:ac8:6645:: with SMTP id j5mr5251258qtp.248.1620852972103;
        Wed, 12 May 2021 13:56:12 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-18.dsl.bell.ca. [216.209.220.18])
        by smtp.gmail.com with ESMTPSA id o189sm920720qkd.60.2021.05.12.13.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 13:56:11 -0700 (PDT)
Date: Wed, 12 May 2021 16:56:10 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, workflows@vger.kernel.org
Subject: introducing patatt patch attestation tool/library
Message-ID: <20210512205610.tdqijwdqh3hiha3q@nitro.local>
Mail-Followup-To: tools@linux.kernel.org, workflows@vger.kernel.org
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

As you may know, I've approached developer patch attestation a few times
already, with mixed results:

- first iteration used separate "attestation documents" via a special
  "signatures@kernel.org" mailing list, but proved to be too fragile and
  convoluted to be practical
- second iteration switched to using in-header signatures using two different
  headers, X-Patch-Hashes and X-Patch-Sig. It was better, but I wasn't quite
  happy with it, because it required manually parsing patch contents in order
  to generate the 3 hashes

Finally, I think I have an implementation that fixes the downsides of the
previous two tries. We still rely on "git mailinfo" to normalize our headers
and body, but we do away with the three different hashes that require parsing
the patch contents. We only generate one header now (X-Developer-Signature),
and the contents of this header are generated using the slightly modified DKIM
standard, covering the following:

- the From header as returned by "git mailinfo"
- the Subject header as returned by "git mailinfo"
- the message body as normalized by "git mailinfo"

This covers all aspects of what is important when it comes to patches and
doesn't result in too much of header bloat. We notably don't sign the "Date"
header because git-send-email will replace it at the time of sending.

Introducing patatt
------------------
I've moved attestation efforts into a standalone tool called "patatt", which
can be found here:

    https://git.kernel.org/pub/scm/utils/patatt/patatt.git
    https://github.com/mricon/patatt

The codebase is only a few hundred lines of code (plus some scaffolding) and
I am hoping that by moving it into a separate project under a very permissive
license (MIT-0) it will see wider adoption.

You can read full details about patatt here:

    https://git.kernel.org/pub/scm/utils/patatt/patatt.git/plain/README.rst
    https://github.com/mricon/patatt/blob/main/README.rst (rendered)

The more interesting aspects of this implementation are around keyring
management, so I invite everyone to read that part in the documentation linked
above.

I did a presentation on patatt at the OpenSSF developer identity workgroup
earlier today, so once the recording is available I will send a follow-up
message with the link.

Current b4 attest users
-----------------------
B4-0.7 (currently in development) will pull in the patatt library when
installed from pip, or you can use it via the submodule by running "git
submodule update --init" in the current master branch.

If you currently use "b4 attest" for your patches, you can continue doing so.
In the 0.7 version this operation will switch to using patatt behind the
scenes without any changes to the "b4 attest" flags. Alternatively, you can
switch to using "patatt sign" without waiting for the 0.7 release.

There's some more testing left to do before 0.7 can be considered
release-quality -- plus some outstanding patches I haven't applied -- but I
expect that it will land before much longer.

Best regards,
-K
