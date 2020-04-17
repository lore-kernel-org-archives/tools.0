Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.984.1587142540069519862
 for <tools@linux.kernel.org>;
 Fri, 17 Apr 2020 09:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MftBXLMh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.195, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f195.google.com with SMTP id o19so3119395qkk.5
        for <tools@linux.kernel.org>; Fri, 17 Apr 2020 09:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EgilRT/mEOXhdwkuXElerN40inNAgmlFl19tFqBByoc=;
        b=MftBXLMhAEMwwMLFFyeTjIoYVcK48qKRmDCE7skupnuVeuOgwDkmzX9Z7mLFZtddZ7
         Cy7aBl0YLVgULROjXbiElXkArk8my9bQhOk3K7eYnBhsf8Wc2eVOHRw+CSybj6qrOyZv
         kdWT7z0RUw/cYf4CF932KRtONVC/Q0LBfZ34A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EgilRT/mEOXhdwkuXElerN40inNAgmlFl19tFqBByoc=;
        b=REc6nyKYOfP76lPzGITtdmZdg8x5qqyhdGNd3C3r5nJL43fTQWOkKrwvcmSRh5UYiO
         ZtKPBJfAmorqgImJl1F0pDaNGI5xN0rsRx9oh1PUmbmIACQvrkIc+hXU9I5l7bX+AY4+
         iJuSISmHHLIbVb1Fua5Eho+DuotvgXm87rRJV3XzoGG3y/FFLfGZtqHBmc8w1Xau6SPx
         E96QZm+4JhPGRn2gKUcKn5Zm7Tv+XW4Mm9t8kAQR5xLCmBnLe55S//bRMS5AQxabsVuL
         2XKoddu38fKfF4SHcK9IByBvBLe+I+VRzPEB+3rdNiiCdrXnut1s1Pkk5VOTZkN9asyk
         p+Iw==
X-Gm-Message-State: AGi0PuYiLfTWgPzaKS79uNfMdvFwfNjQwkAEnoCAzUDyfu0iVSMbRcpM
	+tmrv7iKE7q1mZkCvGFxA/74Dg==
X-Google-Smtp-Source: APiQypKGXyj1e4V/BYmXmI+RyfcbzykW+bB2Zovk98sR2ZsKpBGXN55CgTMXe26jhliWfltJ29SXpg==
X-Received: by 2002:a37:73c5:: with SMTP id o188mr4181755qkc.440.1587142539097;
        Fri, 17 Apr 2020 09:55:39 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id u14sm17754464qtq.41.2020.04.17.09.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 09:55:38 -0700 (PDT)
Date: Fri, 17 Apr 2020 12:55:37 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 ty feature requests
Message-ID: <20200417165537.4xgdj537vw26fai6@chatter.i7.local>
References: <20200417154430.GG5315@sirena.org.uk>
 <20200417161424.y6nlcm6pbavikwch@chatter.i7.local>
 <20200417163939.GH5315@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200417163939.GH5315@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Apr 17, 2020 at 05:39:39PM +0100, Mark Brown wrote:
> > I'm not sure how to convey the tree information. Would it be a sane 
> > approach to try to use current dirname as default, overridable via a 
> > b4.thanks-tree-name value? E.g.:
> 
> > ---
> > Applied to ${treename} ${branch} branch, thanks!
> > ---
> 
> That wouldn't work well for me since I have a single repo with multiple
> remotes - I'm invoking b4 as:
> 
> 	b4 ty -b remote/branch -a

Ah, excellent data point. How about we approach it from a slightly 
different angle. We already allow setting a per-repo 
"thanks-commit-url-mask", but how about also a way to record that in the 
remote section of .git/config, e.g.:

[remote "foo"]
  url = git@gitolite.kernel.org:pub/scm/linux/kernel/git/foo/linux
  fetch = +refs/heads/*:refs/remotes/foo/*
  b4-treename = "foo/linux.git"
  b4-commit-url-mask = "https://git.kernel.org/foo/c/%.8s"

With a template:

---
Applied to ${treename} ${branch}:

${summary}
---

This way when you do `b4 ty -b foo/for-5.8 -a`, you get:

---
Applied to foo/linux.git for-5.8:

[1/2] doc: importance of being foo
      https://git.kernel.org/foo/c/1234abcd
[2/2] drivers/foo: make sure to instantiate foo
      https://git.kernel.org/foo/c/abcd1234
---

Would that work?

-K
