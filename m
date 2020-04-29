Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.1733.1588183103455636199
 for <tools@linux.kernel.org>;
 Wed, 29 Apr 2020 10:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NpJv0sk+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.169, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f169.google.com with SMTP id h124so2909495qke.11
        for <tools@linux.kernel.org>; Wed, 29 Apr 2020 10:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pK5lWQJ0xyJ2RZGdtZeJYukQcdFEs7lbi9+WC6Dw1dQ=;
        b=NpJv0sk+rZroCbDSCmtqSLkL6lQMFiQT8zh9vcZGNXcb7Fh/48JeciokLjiMqtkYDF
         hP4qNIBlNJ8Px0JXlVl/VIHjcGaryyjb/qGek4wGFM5jd5/e8qaGyTHLAGI9DXQ7afxT
         rnHyibU1OPToj8qD5RU/bpDqfubxQXOHP+mBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pK5lWQJ0xyJ2RZGdtZeJYukQcdFEs7lbi9+WC6Dw1dQ=;
        b=hHnJEDpV9nVs7s8xxHfDM4KYzni93zQnA/rPVND04LiJR9Uoa0oI3kuWi9pIk+Ykuu
         AAIl6Qp9cCU43XCESRXIv9P2OjKU73wuIUpbVoj8nAr9Ik0O0COm/lYnToyNWSfjhr9U
         zC71spwRc2V1zclGOgMGg17kzt3SwiCOkQG5pMd27RPcptJpkek7RjVXAh7xT3pW6xoG
         vlatRothjGmPEU+k/UGo+l/HHS5+OHhWEhz5tqCqyaS5g5QF4VpQG/JIuvu24zIM02Ze
         +HlDQ20GBXk9FPbCcLWfPtbIzF6yquyZ/PGwInb293uDbevdyUR7B7HcN79usbMB7QVY
         Yxjw==
X-Gm-Message-State: AGi0PuYWJ1BE8ekeUufGXi5oeq+YhfSSjbUG91iUoKdqgh6svK7WUCsx
	2MrTrWgHiVarKbQ/InIObk/+bw==
X-Google-Smtp-Source: APiQypILAG+vS0AHorLjs0652XvYlAz3sBZFncABtJ++JToGDWDl/u0lVq50nXhCG6aNeI++8Mragw==
X-Received: by 2002:a05:620a:22ab:: with SMTP id p11mr35463059qkh.373.1588183102501;
        Wed, 29 Apr 2020 10:58:22 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id o201sm16444821qke.31.2020.04.29.10.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 10:58:21 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Wed, 29 Apr 2020 13:58:20 -0400
Date: Wed, 29 Apr 2020 13:58:20 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: tools@linux.kernel.org
Subject: Re: [tools] jg expand-am (Was: What is a useful way to show changes between series?)
Message-ID: <20200429175820.bydzqgxmbc5k65qt@chatter.i7.local>
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
 <20200428193550.GX26002@ziepe.ca>
 <20200428194419.i2gamyjgbilp2x73@chatter.i7.local>
 <20200428195555.GY26002@ziepe.ca>
 <20200429164107.lc4sezzibjocwxgo@chatter.i7.local>
 <20200429171540.GD26002@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20200429171540.GD26002@ziepe.ca>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 29, 2020 at 02:15:40PM -0300, Jason Gunthorpe wrote:
> The commits are not the goal. The purpose is to populate the object
> store with evey file blob mentioned in every diff header:
> 
> index a1f053cd30b990..49775cda83dc18 100644
> 
> ie the goal is to create blob 49775cda83dc18
> 
> This effects 'git am -3'. If it has the source blob then it does
> standard 3 way git merge - otherwise it tries less hard and drops .rej
> files.
> 
> The problem comes when a series of patches change the same file
> multiple times. The file might go through blobs A->B->C->D over 4
> patches.
> 
> I probably have the starting blob A, however, my top of tree has that
> file as W. So my git am will produce blobs W->X->Y->Z
> 
> The key thing is that when am applies A->B on top of W it gets W->X. 
> am never creates B.
> 
> Thus when am goes to do B->C it can't find B, and now it can't do 3
> way. If there are conflicts you get .rej files.

Ah, this is a pretty neat hack. It would be fairly easy for b4 to do the 
same thing if we're running "b4 am" inside a git tree -- I'll see if I 
can add that in as an optional "b4 am -3" flag.

Getting back to the original topic, I now better understand what you're 
suggesting. We perform the exact same operation on two different series 
(v1, v2) and then perform:

git range-diff <dummy-base-v1>..<dummy-tip-v1> <dummy-base-v2>..<dummy-tip-v2>

Assuming we were able to find all the blobs, this should effectively 
allow us to range-diff across arbitrary patchsets without knowing the 
base-commit. Neat.

Thanks for suggesting that -- I'll see if I can work that into b4.

-K
