Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.1939.1588087028152675121
 for <tools@linux.kernel.org>;
 Tue, 28 Apr 2020 08:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SUSBWEyj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.52, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qv1-f52.google.com with SMTP id v18so10528222qvx.9
        for <tools@linux.kernel.org>; Tue, 28 Apr 2020 08:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LAEOdBx3KbeVwTbaeCdn3c4TPpuQcpHkmbjN4Ws5Z5Q=;
        b=SUSBWEyjIRWBQzs/3Y6zu8fccNs4S7pj59UM4CewByIAM3+j2T2gw08fCVd3otflgo
         aR6t8BtbaHF41DA8ZmIPXctQnWUwgJ7R6/xd7CV2WHadrAbQitRlgU+Bm2w4/cAytCcD
         OOUJvUgSGYCuD+kEDqXJEVjUWhdIsKkjp6mok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LAEOdBx3KbeVwTbaeCdn3c4TPpuQcpHkmbjN4Ws5Z5Q=;
        b=kKc5w9H+2HuBjuYtBrM+OQsg3cJpCtCYdyNOIVj8HW8F5xUM1riP1tK+c4V47Gyxsq
         KA7A9qQYuMgIJdrlZr8o5cL2H9FsDfupCsF40KN5N4UcyceC2shC7ZE4It1K6s18NId6
         df+v4D3FPIl2///wJt65kpn4Dx3si5SlcR1log23X1rmicUGfLGeo0FQKHKYa3O/VMdQ
         1d59tUQfj42fUdRcJteaGAjhh/LRGbLeh2O7z4D9LkiPyw4/h8FfvQddnIVga6v/ISLs
         MC2FoWyDgQP1wTazGCbqSHALuRaeeBg74i8Jl3zGgY1m1nz8t3PZaD938XSx+wYf5QZ8
         1zNA==
X-Gm-Message-State: AGi0PuY9/4oJ5+Cw+mDJxAEvRn2QzLcFIt9D9W0MRwW0lmtjftYINgJs
	1ccQzgHI4eSd/EJyQiDdVbgq8RRoQvY=
X-Google-Smtp-Source: APiQypLknppKI9Bz6S5/pLoK5LeV2q21DZjp5GiWUi14zna0elHpPEZ3tExgo9DzNK1FSsS8TI88qg==
X-Received: by 2002:a0c:90e7:: with SMTP id p94mr12900500qvp.219.1588087026889;
        Tue, 28 Apr 2020 08:17:06 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id z26sm13822135qkg.39.2020.04.28.08.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 08:17:03 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Tue, 28 Apr 2020 11:16:56 -0400
Date: Tue, 28 Apr 2020 11:16:56 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
	users@linux.kernel.org
Subject: Re: [tools] b4 v0.4.0 available with new features
Message-ID: <20200428151656.5qz5yiclxmffcnga@chatter.i7.local>
References: <20200424170442.ad3b3j5f5vkbcmvb@chatter.i7.local>
 <yq1lfmkbgoi.fsf@oracle.com>
 <20200427184051.ol7znhab6khqvjas@chatter.i7.local>
 <yq11ro89x54.fsf@oracle.com>
MIME-Version: 1.0
In-Reply-To: <yq11ro89x54.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Apr 27, 2020 at 10:12:07PM -0400, Martin K. Petersen wrote:
> Second issue:
> 
> I have had a few cases today where my merge edits meant that b4 ty
> couldn't match the original patch-id up with a commit in my tree.
> 
> I can see the patches in question with b4 ty --list but b4 ty -s N
> fails because no match can be found. It would be nice to have a way to
> specify a commit hash and have b4 still write a .thanks file even when
> the patch-id matching fails. Something like:
> 
> $ b4 ty -s 10 -c <SHA>
> 
> would produce the thank you note with <SHA> as the ${summary} commit
> link.
> 
> It would also be great for the matching to be more forgiving (capturing
> per-patch message-id and matching with Link: tag, for instance). But I
> still think I might end up in situations where I would like to be able
> to force a thank you note given a ty id number and a commit hash.

Interesting -- did you modify the subjects of those commits as well?  
We're already falling back to matching by subject when we can't find 
exact patch-id matches.

How about we create a .thanks file even if no match is found (when used 
with -s, not --auto), except the summary will omit the commit-id 
information. You can then add that information manually or just send 
without it. After all, if you know for sure that you've applied that 
patch, then we shouldn't be stopping you from notifying the submitter 
about it.

So:

b4 ty -s 1,2,3

will always generate a .thanks file for those series, and will omit 
comit-id information when not found.

Does that sound okay?

-K
