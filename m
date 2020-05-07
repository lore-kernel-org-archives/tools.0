Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.3354.1588882804954116893
 for <tools@linux.kernel.org>;
 Thu, 07 May 2020 13:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aV3Bj0Q5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.46, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f46.google.com with SMTP id c4so3347459qvi.6
        for <tools@linux.kernel.org>; Thu, 07 May 2020 13:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SAOyAfzQPzgvBuSOa2DpOpnIFUEEXsxTH4sKFWAF/F4=;
        b=aV3Bj0Q5F3mJyp0aEg1wlJtdY1aTf2eSINmu7DcjJj4/+rMjNR/Dh9oqYR+Ct6/7Dh
         ljLomTGyge0JWuUGRmN+vH8EWvQeKX0FzKTPIbYGq+f2gQSFjWgYhN/VMzDHIoexebLY
         DYVg/cmk/lEEunPzU8J2KoOzS+GsumOrlDDLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SAOyAfzQPzgvBuSOa2DpOpnIFUEEXsxTH4sKFWAF/F4=;
        b=NzBNLpOJb6CKaiek0pYZqbGXmGpyqCIXO+uox3/tfecQPPsWWRNRrhPnCTAOd6ZkQ4
         5zFI3JdD8LKYoM68bdxGElcIx0/OIZ4cs2cPmZiid/iO9aLb99VxJ3Qj7EODJ82o+ulE
         igeOFXQ8gjgW0/SFyaQtQJuwzJ63qFZ+Dsbd+UXxWOvKixJonghshhtc3izvH9p+OBtQ
         nGEfZrNFhfbaIv8KPSafsa0TyvRcv0MFEj/DaI/olE+ET56mW/yWBN0kTfxmKRKdkM1R
         ApnK70G4o8Q6ytoUM1i1+LsWO4PWaf4VHP8jhfIxNO9H4aQO3EwDIEvrdwctjNHGLY/i
         l2Zw==
X-Gm-Message-State: AGi0PubXggVhW4V9G8qSFAKNxkt0InB9ltCnXaRUe0gDOTVBpAqoCFzq
	znELK4ohCfm0aB0ZVKj62cwj3Q==
X-Google-Smtp-Source: APiQypJ7kCWQHTG8SPxHfeZXGInAW+Of/pjVNsuGUI2rI3lAasRMDqz7j+TFtTG11fe4x9cw77YyPg==
X-Received: by 2002:a0c:f883:: with SMTP id u3mr15831596qvn.86.1588882804047;
        Thu, 07 May 2020 13:20:04 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id k58sm5375892qtf.40.2020.05.07.13.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 13:20:03 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Thu, 07 May 2020 16:20:01 -0400
Date: Thu, 7 May 2020 16:20:01 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] b4 v0.4.0 available with new features
Message-ID: <20200507202001.3sststasmemmgr5z@chatter.i7.local>
References: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
 <CAL_JsqK+FyXZZ3uAcAsVFLYoxjzj_fpMLF=DFe3M2Byi9Fd6Xw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqK+FyXZZ3uAcAsVFLYoxjzj_fpMLF=DFe3M2Byi9Fd6Xw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 06, 2020 at 02:23:16PM -0500, Rob Herring wrote:
> I found a minor issue on patches with no 'To' header. They end up with 
> this:
> 
> To: unlisted-recipients: no To-header on input <;
> 
> However, that appears to be a public-inbox problem as it's on there
> too. Here's an example[1].

Interesting. I'm not seeing any strange output from that series. "b4 am" 
and "b4 ty" seem to be generating proper things.

Can you try with the latest master/stable-0.4.y and show me the place 
where this is still showing up? When I do it, the .mbx file is just 
missing the "To:" header entirely.

Regards,
-K
