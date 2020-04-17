Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.94.1587140069500789367
 for <tools@linux.kernel.org>;
 Fri, 17 Apr 2020 09:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LyN9Peze;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.181, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f181.google.com with SMTP id q17so2398082qtp.4
        for <tools@linux.kernel.org>; Fri, 17 Apr 2020 09:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7+6HjVvn6wXpJwsewZx51Vw1yq24Z5NtqWUM+cOf6uM=;
        b=LyN9PezeSFUC1cOGrDygj0218+y7bOF8ZX4hL5LdJk8rfZMhcQ1123ECW/fust6/9Z
         6Bh7TEJsIfJLlY0d5wvO2yF3ueejqKEpJMVi9FeTHEJYp1fSDV9ydM9mhXLMAZRnVfQo
         /aNTP94+Qfn/My5/1wcsKUfTSvOVlceSTecVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7+6HjVvn6wXpJwsewZx51Vw1yq24Z5NtqWUM+cOf6uM=;
        b=RKl1qHpybrYcypT0TIMYwbaB8m9goSf552U9oINAeMb7h01x/M78fg0qGGJbuwXGTI
         Ozpx5DAR2nElU34LxdxcXJkNUerAHOoyjXhCtlBoDa8Ke1/XjzDOMk4cEN0kR0IJLfk6
         sZ9OWjqQi09lL8aKqdfOh90BcIP0E5HBRclChVTRI9M5rpHYK24+hx2FhZwa0GEQS/9y
         Dg5QgaFtGr6alByQb9StDWuK6gWfTWW1Gpm9Ev2wFDmB5m/UmVbGRuiFahn0GWQJC9LR
         x+krA132+T8eGDXbHuaLOzTIXQz3jAujuFL7KqUOPZNMh8rV2aK5kdXgbzm/vhseU4Fl
         GPjw==
X-Gm-Message-State: AGi0Pua6/DHxBbb3mztyGO7TniJfEQgHHOv7fud842WiXbOOS58Zl1q1
	IKk27moVzXkykNKd5RK4RSh/DA==
X-Google-Smtp-Source: APiQypLie9Ylqsmq5eGF1w2GBewOLgY4NRJavVLT2xnrrVHRsl/tkt9AzGGvmXkPdX6cArjh7wocPQ==
X-Received: by 2002:ac8:8a:: with SMTP id c10mr3761970qtg.369.1587140068579;
        Fri, 17 Apr 2020 09:14:28 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id c207sm17447919qkb.7.2020.04.17.09.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 09:14:25 -0700 (PDT)
Date: Fri, 17 Apr 2020 12:14:24 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 ty feature requests
Message-ID: <20200417161424.y6nlcm6pbavikwch@chatter.i7.local>
References: <20200417154430.GG5315@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200417154430.GG5315@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Apr 17, 2020 at 04:44:30PM +0100, Mark Brown wrote:
> I've started using b4 ty to generate thanks mails in production and it
> seems to be working very well for me so far, thanks!

Excellent. Thanks for helping iron out the kinks.

> One thing that would be nice would be mechanism to supply some
> additional values to be filled in the templates - I want to be able to
> tell people what tree and branch I applied things to.  A command line
> option to set the templates might also work but would be clunkier for
> me.

Branch would be easy, e.g.:

---
Applied to ${branch}, thanks!
---

I'm not sure how to convey the tree information. Would it be a sane 
approach to try to use current dirname as default, overridable via a 
b4.thanks-tree-name value? E.g.:

---
Applied to ${treename} ${branch} branch, thanks!
---

Becomes:

---
Applied to spi.git for-next branch, thanks!
---

-K
