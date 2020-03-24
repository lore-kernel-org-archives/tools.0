Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.7382.1585060423622116009
 for <tools@linux.kernel.org>;
 Tue, 24 Mar 2020 07:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dgrlJCuO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id a81so3637230wmf.5
        for <tools@linux.kernel.org>; Tue, 24 Mar 2020 07:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=br/uxxktYxra1+32yxK3q7fiaa51nkgbQ6HXcF7S/2Q=;
        b=dgrlJCuOReBbCZEdcjxb4gl0LpdgPNYoIC/oFCVnVs5CMQIBo47YAHyvrJPNGRiqMn
         uu8PiuMkES57uEjGK+lCrexN8Y+5Rvr5h81tx5O7sdUJKF2qzhRyVTPniU552eVMIytg
         /ledL6QOFgYIBQ1PW01fF6JQfbml1fR83PnVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=br/uxxktYxra1+32yxK3q7fiaa51nkgbQ6HXcF7S/2Q=;
        b=KrDJmpTorIMHNL/QhOCY8clNyXJH4jVhYwmU75NtxqiJ8cG3hVXGCFSJMdNQYlpjcD
         BLStH2h2+EBof+cYYJrZxdU+ia5IbR8OnNeVz30bYfPa6nGvJq6b+oAAWMFUNoJ5mDfj
         HQ+T2aadfD6lwUt8KlUFsEKKeOYK5Nnco+TcXHDyk/XIrvXU7881IWCo5DSGnb4FeZFl
         adqlA/ZOADE9lPenuBBipLbyWNARgljnsKuhF3RlMn/0VHc9iUHb87+tD1fQJ5IPtmjz
         hXHZahf5A3vVWnua9t7NIjwDirl/G6Wp54F49rgkS8diouPXPdJHF8+hvuPiCjh6ahV2
         4nzA==
X-Gm-Message-State: ANhLgQ1tOWN0hT+t+mxPQMGviuFG6sgvDAKXWUHhOlD/UXI4GNE1cyFG
	02KWdReu8LdTtd/zwNE31mSy0A==
X-Google-Smtp-Source: ADFU+vsBcabDnuDtLif4adIal9rQqa/vcNC0Q+EKSZ+inhnvKo76m1q+4jXBegfbxIN4FmWTWdA/rg==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr6254067wml.154.1585060421167;
        Tue, 24 Mar 2020 07:33:41 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([51.158.111.157])
        by smtp.gmail.com with ESMTPSA id i4sm29900655wrm.32.2020.03.24.07.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 07:33:40 -0700 (PDT)
Date: Tue, 24 Mar 2020 10:33:36 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] Fix invocation of b4.sh through a symlink
Message-ID: <20200324143336.rqwxnp3dutchlqah@chatter.i7.local>
References: <20200324090057.25409-1-geert@linux-m68k.org>
MIME-Version: 1.0
In-Reply-To: <20200324090057.25409-1-geert@linux-m68k.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Mar 24, 2020 at 10:00:57AM +0100, Geert Uytterhoeven wrote:
> If b4 in your $PATH is a symlink pointing to b4.sh, $SCRIPT_TOP points
> to the directory containing the symlink, and b4/command.py cannot be
> found.
> 
> Fix this by following any symlinks, if present.
> 
> After this it works for being invoked through either an alias, symlink,
> or plain path.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Stack Overflow tells me "readlink -f" is not supported on OS X and some
> BSDs. Do we care?

I used a similar patch that Greg sent because it used "realpath" 
instead. It doesn't exist at all on OSX/BSDs, but if they are doing any 
kernel development at all, they probably know how to install coreutils.  
I think that's an easier requirement than setting up a GNU-compatible 
version of readlink.

Best,
-K
