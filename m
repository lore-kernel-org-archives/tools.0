Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F80F3382CF
	for <tools@linux.kernel.org>; Sat,  7 Feb 2026 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770480580; cv=pass; b=EeAX/AYCABnW6RUW4jibVZzHzfihzxzmp4l/jWoK7wZuru7c76LxsmWTuIoSZpbvvGEflwCqIKBP1JBJ+3RxqY/uxMyJ04jn8X5vIrQFRNgCalftREW04DpGLi0aU3E14aKckSKK8D10xgDJfVaM/mVGqgT0ul2P2v6s9S7jBT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770480580; c=relaxed/simple;
	bh=AtJZ/A1hgAx9rbwtk7LthFQLWPMAt74TQ5R4JGe08P8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=scdLRthrpIc0i4vq6TO1IKsCUvAppRUyaj7wieX/Coe4k7eC82o7yEyCrZHYe17C8F0vFEy+9eVLCb5qVeIV8+3PYkQY/eG+gCqq4aCs+t4fHbcrT/0YLknVktkcUEm/hX/LjtMN6iAcaeUncn2EyZPowKmgKac5z5Ef3v7f7Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TeljYPHb; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TeljYPHb"
Received: by smtp.kernel.org (Postfix)
	id F3E26C19423; Sat,  7 Feb 2026 16:09:39 +0000 (UTC)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3058BC16AAE
	for <tools@kernel.org>; Sat,  7 Feb 2026 16:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3058BC16AAE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1233b953bebso7461219c88.1
        for <tools@kernel.org>; Sat, 07 Feb 2026 08:09:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770480578; cv=none;
        d=google.com; s=arc-20240605;
        b=GiVNkhCYmW41gKHDop8FwfYVUjSr8EA8ScCYiLMkD1TSzWii3NOwIHTxq9HBkosJlx
         4N+sJuxOKJ7/jqoc/zkVkPKjx1gkwJ0HtFz/bjg0g8NnAFxWsTUHXfXrROP4ETeSam7h
         D6ndzb2f8fxSOyExOOGFk8s6unNnyErcZfuXfDRo/0ECPP8ex0b/EqvkQKnSal/Al4an
         j5L3pU/XaQA4rojLbaCUDbHnRZVC2BQSw56XRHd4QKyFHwQQ1Kur7nW+mj7YrvqnjEuC
         admtkDj9Cb8yDIlhMvgoZIsJqTPzXCsVNp+b/ysEH9wNyzQ1Bdge1HcOZjQlC/JBR73H
         PdlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/wzBEeAC1PYRdkbaj2Qhz5RQMz6fBfKZv5n4hyldxYc=;
        fh=hEAhbY4Z4VJioW+1JHx+fHJtlsKxnPuHOkoU5UdidNA=;
        b=FV7BEuNjTHC3ExrrI/0YIskFKMiq7IDGgLYzXfMJ59KGM1XOEJbn3bprzSq+Te0aIs
         pljgPpgFlayTxTYx+tyHVNyRTSgbo0hrKLXYGjGIKOWtN+5+0iEAilMCcdMrneglLsOk
         EH1yr2vKWniK70Dlk+KnHU5e0JooiaCmZrLPFCmsB+5VhnbnwMMHa2ZwuEF5X0taK9Wx
         j3JQ2lCGPeSHRgCdzBtcGj9yzORsQxPlsN9xk7Pqd1uO6AfRa8QnEgSCaXk+WAaDqEE0
         tZ54N6XZS4hvWyoDJEMSHNj28ermCPfHvCgecsC/fnfnPCMBgERvcFiJjeQ21Qxaa0hX
         C62g==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770480578; x=1771085378; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/wzBEeAC1PYRdkbaj2Qhz5RQMz6fBfKZv5n4hyldxYc=;
        b=TeljYPHbLcgTuEfvqOiwmyhSBDbQ43pXFLHEquijWRp+7H5nTiXFepfug0oAzdfGU4
         axRnfOIedJUmbOetbTwcM/LufEnVQmX92mhf3I71NuHq2y0cCLSSXKjOoQXHqcXax1o1
         C/r+emShu/4ELT4VwMZz2jZJdMdnyTkmfRt+3YTE1cHe24n92jtZ8JQd443ObchiV0sl
         8Xt1gyb3vFOL0lr8Wd4gXWsQdPElRNcxzrAdS7EdnAPMQL5yma8Pp3Y8gDxYGJk7E61g
         wiEwKA3lXwqstg6fGuQMGe+rijfDoRJYSLNucG/asxLpNzvZOjqMCae+eMO11hcnsXsD
         YgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770480578; x=1771085378;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/wzBEeAC1PYRdkbaj2Qhz5RQMz6fBfKZv5n4hyldxYc=;
        b=xF6TvM0boeewWjxq7oYKevo44+Wr/GTMsapE00GX05mHcfXPMXx5Q1mVFnTo7q4L2E
         +NLi8SOpbg8Z0DhXlH9M6Nn3xLTk+dfSUkAdh24i8cx/g+oySwstEWiHmnYfKEmVytyI
         uNln353b4C4Wq+d0QMk2ggbgc/Bp7jflCgVyMF3KRWqejT8vj7LcyuYxEdAZtE0X6rZ9
         6OHti9ulBh9XaOKAbHTLDj4HL8hdgkHS5C/0GQfeAdOoaPy4n8fq7VGw+qMRkj7nJRBL
         lTQuYW8SLmr8a4ndL3NoDKqYUnO2CONpc7G6yGXG4v5is76DPU/nnV2k57NIhJvrG87U
         NI9w==
X-Gm-Message-State: AOJu0Yxqvu6P4jHDbz8jg8szfWV5infYReAWPi74qU/+lpsXIwpB6uZA
	kiDCRUPiH4mtKmH0xFBrZ2i3a/2lG5TZJ1BOtPKBnZRZ74O+XM7gWWQJVLvvl3+J3oIMzKc0XL/
	zuWgCYRMW0KEdPXwraXxsBq1aqkRjquqtEt91
X-Gm-Gg: AZuq6aLgHW6qDXDtg2jYYmcCpii2Ff/TPOX1wpVuxKodu4QDkyVAdEcMu+TRuUxyPKe
	y6RWaNc2TJBGgIhJECcP11JGDOq3qDyepotE6XzwoHGiUYy5dMyXo1GO/v95shE+9mMbxJ80Knm
	pduBq+g9vJUxjqGIltZ1zxJ0nLnZW2p/tED/XedOKMG7lof1tZRhh0NaEuTrHWxqazaG2lxT7nK
	m+slfbbEl1oEdvwBe+InFDv+PmAXvR3i5fCnM5JeYHb3psjGcVIq8BKzHFrP3HEkmpbiRiSzE3f
	OMd8gDVSMo2gz54CNdhveksE4kJw
X-Received: by 2002:a05:7022:220b:b0:119:e56b:c74b with SMTP id
 a92af1059eb24-12704001542mr3284713c88.16.1770480577920; Sat, 07 Feb 2026
 08:09:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Liam Mitchell <mitchell.liam@gmail.com>
Date: Sat, 7 Feb 2026 17:09:26 +0100
X-Gm-Features: AZwV_QhIbFGkpDBrOsSm1pLSmRYkCsGD-lldYj8Gits3nnk6YEJC8WAri60TLJs
Message-ID: <CAOQ1CL4neLRd4t4WZ9mR1r8rF+R7hda61dfOvXDV72u8-MWt8w@mail.gmail.com>
Subject: B4 errors after changing git author
To: tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, I encountered unhelpful errors while using b4.

The following commands worked fine:
$ b4 prep -n bcm5974-reset -f v6.18
$ git cherry-pick 52007b920a7b
$ b4 prep --edit-cover

While editing the cover letter, I noticed the author email was wrong
and updated in git config and the latest commit:
$ git config user.email mitchell.liam@gmail.com
$ git commit --amend --reset-author

Notice I didn't update the author in the cover letter commit, only the
cherry-picked commit.
The next commands failed with unhelpful errors.

$ b4 prep --auto-to-cc
Will collect To: addresses using get_maintainer.pl
Will collect Cc: addresses using get_maintainer.pl
Traceback (most recent call last):
  File "/usr/bin/b4", line 8, in <module>
    sys.exit(cmd())
             ~~~^^
  File "/usr/lib/python3.14/site-packages/b4/command.py", line 417, in cmd
    cmdargs.func(cmdargs)
    ~~~~~~~~~~~~^^^^^^^^^
  File "/usr/lib/python3.14/site-packages/b4/command.py", line 83, in cmd_prep
    b4.ez.cmd_prep(cmdargs)
    ~~~~~~~~~~~~~~^^^^^^^^^
  File "/usr/lib/python3.14/site-packages/b4/ez.py", line 2907, in cmd_prep
    auto_to_cc()
    ~~~~~~~~~~^^
  File "/usr/lib/python3.14/site-packages/b4/ez.py", line 2731, in auto_to_cc
    tos, ccs, tag_msg, patches = get_prep_branch_as_patches()
                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~^^
  File "/usr/lib/python3.14/site-packages/b4/ez.py", line 1518, in
get_prep_branch_as_patches
    prefixes += tracking['series'].get('prefixes', list())
                ~~~~~~~~^^^^^^^^^^
KeyError: 'series'

$ b4 prep --edit-cover
CRITICAL: This is not a prep-managed branch.

I figured out that the cover letter author was the problem and fixed it with:
$ git rebase --reset-author v6.18

A more helpful error message could help the next person who stumbles into this.

Thanks,
Liam
