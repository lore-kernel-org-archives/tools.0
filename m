Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web08.5122.1606399010930366765
 for <tools@linux.kernel.org>;
 Thu, 26 Nov 2020 05:56:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SX6Xsgs5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.174, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f174.google.com with SMTP id p12so1135108qtp.7
        for <tools@linux.kernel.org>; Thu, 26 Nov 2020 05:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eV7tkKkeal1hE3L6zhF6OxxhUhg0oTrwGAsztuG8gmg=;
        b=SX6Xsgs5Sm9XCS9T7UIDawKixUFOgF94UF9XS6MG6DcyEqoZuud0Sk5Ks22tt5ekTJ
         95z6PWwap34U+eBjx4wQu9ausL7u6ipreo87TGfJt7LeY96xBMBlR83XHF+Epp+Jg+tJ
         imbIX5YTPh81EEUkU3MXAn9lKLTE5xkwxTlXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eV7tkKkeal1hE3L6zhF6OxxhUhg0oTrwGAsztuG8gmg=;
        b=LyJzxukbA8oRc53SVWMNyhqRipwx0SFPLDq1UtoY324Kyinh91UFi9BXJSPAgEEyTd
         qH5C8i8qKimyv8m3By3kw+YTdk5xPd5DfyLbQ/WwYR7HN1w3mX5NiwGBXO3LBi/EQNBI
         7osTVAkvWLdoIyZjDi5wleryybsai3NIsgj59Pkw+WmdpSl5c7lo7y8xY3Ag6uhjK+HW
         XKwTCBdRkCQO+hOVXnw74bTGJCExCMQU7mMNVBSawkHWkcvDrhXF5pvldv2FJoRSH5o8
         wZt36vzQAEaAjTNkpsIMVHmdDmSQ9XGQFOY6or+aiiIa9LUm/+3j7Db+3lfSq2XWuJ/V
         WsYg==
X-Gm-Message-State: AOAM532J2TduIRoGNBduxQksfRCiM5XvJQ9q6Fu++an7/9haKLHDiFJU
	FwVdCEUD/8QvtLfhuZNMrCS6PA==
X-Google-Smtp-Source: ABdhPJwa/S531SxLg26kUVxkfEp/Qv0LBXvvmMPaN8FJfNdyFYcpExLsuS+HHBLui2OJ8LAowSPtRA==
X-Received: by 2002:ac8:5c13:: with SMTP id i19mr3272349qti.250.1606399009981;
        Thu, 26 Nov 2020 05:56:49 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id d9sm2519775qtr.68.2020.11.26.05.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 05:56:49 -0800 (PST)
Date: Thu, 26 Nov 2020 08:56:47 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: [kernel.org users] [b4] version 0.5.3 is available
Message-ID: <20201126135647.2wfxvk7yu7r2ley2@chatter.i7.local>
References: <20201125221522.jk4kdfyfur6zblvp@chatter.i7.local>
 <98da4f38-84e4-558b-ab57-a4a15a0f8687@kernel.org>
MIME-Version: 1.0
In-Reply-To: <98da4f38-84e4-558b-ab57-a4a15a0f8687@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Nov 26, 2020 at 10:58:33AM +0100, Jiri Slaby wrote:
> > I've released b4 version 0.5.3, which offers a handful of bugfixes 
> > and
> > small enhancements in the stable-0.5.y branch. This is expected to be
> > the last release in the 0.5.x series.
> 
> Hi, did you forget to push the branch? The tag, I can see. It's one commit
> on the top of stable-0.5.y.

Yes indeed, sorry about that.

-K
