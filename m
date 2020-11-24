Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.53282.1606229556115894517
 for <tools@linux.kernel.org>;
 Tue, 24 Nov 2020 06:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jazpp7jJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.181, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f181.google.com with SMTP id v143so20635578qkb.2
        for <tools@linux.kernel.org>; Tue, 24 Nov 2020 06:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hyaOCexaen9es9YgjAEO6fXjNFh36LDZgRVAgbqCyNw=;
        b=Jazpp7jJEZ7GEbNp54y5IH+wDoZwSuqxDMXwPVlgSilNIOUfrSBAq+lB3NujxJM4Tt
         fFL2VHn/RvlyA0k4Bu6NQ2C5rQj+Ruuga4CjirSsXqgaLHBF3ybrpgNk0iODNB39JXaC
         /ICVX1vi2Yt1RztRpryn2pUvs9YsFOZz0lw1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=hyaOCexaen9es9YgjAEO6fXjNFh36LDZgRVAgbqCyNw=;
        b=Kjlv1qOJE7sB0mfGw9DvWWZmvjBzNzKAZrbfVwJb8V5K48QxMehlsBNs2+Yqhszq5d
         bMAT/XgjWSBCSOnVXL0R1prk+jGHnLCXiXGaTftkkP+/qKW0YYcakHs5SF6U8BNaQaIN
         CiP7oCDgTslf0cxcfrUG90gWlpm8rNR0pzYJ0lfaRt2RVx2zbOatAZxNynAOeSgafmES
         7FMkLEkZu5uqDlpQtRZhWBCBIaySswQ7OCALYOMhK+rChkBgPR1uQny35M/OAM4RmU66
         FkM3rFgdCmdU11C3EWZIbTVRQY42w9fXiDa6d1etJjhDV7jqy41xqEbobh1lyRsyqIZ7
         qzkg==
X-Gm-Message-State: AOAM532BWztPgdYXOWJQjgcmPZms4GT81kF7v2gno0HvVKRvds7Uho1I
	KMwAs25kAz5x8mcii16KgHLL9A==
X-Google-Smtp-Source: ABdhPJwXQwKC+Ewn9twUXAHyQgzVap8qx+Cl04ux+C4/i7EFmgpMeRABEK+L2i/kD5l3OISa2YbJKg==
X-Received: by 2002:a37:4c4a:: with SMTP id z71mr5286234qka.2.1606229555231;
        Tue, 24 Nov 2020 06:52:35 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id t126sm13347682qkh.133.2020.11.24.06.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 06:52:34 -0800 (PST)
Sender: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Tue, 24 Nov 2020 09:52:32 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Philippe Blain <levraiphilippeblain@gmail.com>
Cc: tools@linux.kernel.org
Subject: Re: [BUG] b4 can't grap thread with already-percent-encoded slash
Message-ID: <20201124145232.2mnfvyqy5cdb7ds7@chatter.i7.local>
References: <2ce40a78-4291-c01c-f468-8b7f3be2f379@gmail.com>
 <20201124144542.arws25irjgylbrqa@chatter.i7.local>
 <8a1500fe-7c1a-2904-7723-8e638f524c03@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8a1500fe-7c1a-2904-7723-8e638f524c03@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Nov 24, 2020 at 09:49:41AM -0500, Philippe Blain wrote:
> > Yes, I kept meaning to fix that -- thanks for the reminder. The 
> > latest master/stable-0.5.y have a fix for that.
> 
> Not sure if you mean that it should be fixed in master... I installed b4 using
> 
> pip3 install --user --upgrade git+https://git.kernel.org/pub/scm/utils/b4/b4.git#egg=b4
> 
> so I'm at version 0.6.0-dev. Is it supposed to work ?

No, I *just* fixed it, so you'll need the latest master.
You can just run it from checkout, if you prefer. I just have have the 
following in my .bash_profile:

alias b4="$HOME/work/git/b4/b4.sh"

-K
