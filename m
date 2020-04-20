Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web11.6502.1587401723875958073
 for <tools@linux.kernel.org>;
 Mon, 20 Apr 2020 09:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aQnd8B5c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.195, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-lj1-f195.google.com with SMTP id e25so10803707ljg.5
        for <tools@linux.kernel.org>; Mon, 20 Apr 2020 09:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vE9JgoHouSRJfwcXvPMYd3ku3AN2dTHJ/Nsmfd9cup8=;
        b=aQnd8B5cJ232ikzcpiJDKOj5TiHVBNNsarQkrT+iPDTSOTUqGCH+4/sD216zLWYCPg
         Dd0Eg6cucGnZ2xNTq1o+yJV7jbIU9QQJlML90LPsp25sM9bar8Xi3AzP+rq3nNO6swRU
         ayq/mgT/z7t+aCJHm31doJ76xSe1QhACHW0X4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vE9JgoHouSRJfwcXvPMYd3ku3AN2dTHJ/Nsmfd9cup8=;
        b=b2JL/4KSxf3ZW3QodIBG0DCjbUYdg/Qb/GnB1PAl5z9NCXFjRn1vIEfo/MGDrA2WP3
         8oPkxVLGGvs5zmUP+UxXCGmKEGBIq3x5U1JmZjPaB3A9lC2jA3GJyw8THq+k5+Udu6HO
         EK6DvX4JuvVWXac4NgUuvS3QfdoeBJb6CQuzxJYRl2llvY5qWVq1MwK8Abaubmg8WcPc
         XGpmApopyEmkvc91vmCc9BV8CcJIRUlxclYR3msabyOIegyzb0ljy3N/T94pmtlkG7gQ
         eZXO3SJ93t6BtGPKedHCefFeCDxL5TgAA6snfpNMtZtils3vfp1aO13XnGkFg2BeYHOE
         Gsqw==
X-Gm-Message-State: AGi0PuZxPqEsHPYTHdS5d13EeTMMnCi2Gfs7A1j/XGJv1pbZCFxrcEOe
	8ECDa96pNMI6n4ca4yE4JrhiiQ==
X-Google-Smtp-Source: APiQypKVKW2htRtz+P7fzuIjZ0sG681asoj0EEcQkvrjXO1A3ZDl6MZEHgepwdjVeKQ9aLqch2ZXaw==
X-Received: by 2002:a05:651c:515:: with SMTP id o21mr10980701ljp.91.1587401721976;
        Mon, 20 Apr 2020 09:55:21 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local (tor-exit1-readme.dfri.se. [171.25.193.77])
        by smtp.gmail.com with ESMTPSA id 6sm18195ljq.36.2020.04.20.09.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 09:55:20 -0700 (PDT)
Date: Mon, 20 Apr 2020 12:55:17 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tools@linux.kernel.org,
	"users@linux.kernel.org" <users@linux.kernel.org>
Subject: Re: b4 am doesn't see patch 2/2
Message-ID: <20200420165517.7dcqowrrapdc7qad@chatter.i7.local>
References: <CAMuHMdUEy-95tQExorPvTUjXzcOfJkp4BFtRYN10koDPmwMoZw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUEy-95tQExorPvTUjXzcOfJkp4BFtRYN10koDPmwMoZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Apr 20, 2020 at 04:02:04PM +0200, Geert Uytterhoeven wrote:
> Hi Konstantin,
> 
> While
> 
>      b4 mbox 20200420123844.3998746-2-arnd@arndb.de
> 
> fetches all files, "b4 am" only sees the first patch:
> 
>     $ b4 am 20200420123844.3998746-2-arnd@arndb.de
>     Analyzing 2 messages in the thread
>     ---
>     Thread incomplete, attempting to backfill
>     ---
>     Writing ./20200420_arnd_sh_remove_sh5_support.mbx
>       [PATCH 1/2] sh: remove sh5 support
>       ERROR: missing [2/2]!
>     ---
>     Total patches: 1
>     ---
>     WARNING: Thread incomplete!
>      Link: https://lore.kernel.org/r/20200420123844.3998746-1-arnd@arndb.de
>      Base: not found, sorry
>            git checkout -b 20200420_arnd_arndb_de master
>            git am ./20200420_arnd_sh_remove_sh5_support.mbx
> 
> It doesn't matter whether I pass the Message-Id of the first or second 
> patch.

Ah, good one. That patch has nothing but file deletes, so in the absence 
of @@ @@ lines, we didn't recognize it as a patch.

Both master and stable-0.3.y have a fix for this now, and I will release 
0.3.8 in the near future.

Thanks,
-K
