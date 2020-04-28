Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.2858.1588102552282454942
 for <tools@linux.kernel.org>;
 Tue, 28 Apr 2020 12:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ziepe.ca header.s=google header.b=YSTLPqBq;
 spf=pass (domain: ziepe.ca, ip: 209.85.160.195, mailfrom: jgg@ziepe.ca)
Received: by mail-qt1-f195.google.com with SMTP id c23so17812203qtp.11
        for <tools@linux.kernel.org>; Tue, 28 Apr 2020 12:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RDCxUVXJr4Of0cmKoT7CRPmB2pYbNURD9LEDoLaUKBA=;
        b=YSTLPqBqUUu2RAbZF8EDwzaX7c+9/QRgGgFRx34yUUIpYuzKVD6YtBDbxfKs5d5R8q
         CTRHVClReckqjCP7/t6OzLC2mNNdhY/u/7lzQ3t3PdFnDmeO86duiLuq4CvpOxYFiRnV
         dcIqWFwQ1UerofOcGU134Gk0N0yjaQyYrjbjsu8eVLnDK4Tsv1yk3tBo0Hhn1o5YBLLw
         mnwfYj5bGPzFHpH9pWqbQs77cf0x1dX+2Rk2HT6A+xDH40NmW9DnQysvRZCxPQf18yTE
         CWgrwjDu2s5j64XpRYpygtX/4L4+ORwOMvgMF9oHA6OLZNxVLSTqFRPJGYfMu1Wr/yGD
         UPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RDCxUVXJr4Of0cmKoT7CRPmB2pYbNURD9LEDoLaUKBA=;
        b=c84J7ulAgoYtpHPztHPrmjMatWWlbQfFLkRHli/LroUSyvs2xrn7v24UbEvQXDIE3m
         Jc+x2MF7DBkEKtOPkbNNplt4779qMSPa7CRyUBPlu5LZx9qtgTyAtJyP3yIfOt+83Vug
         0g6tJcAvaCg64z9wn9He04J3xY+OtFz4uhT1bkAsgT2oGbInc8JjKT84euHjuEqBALH0
         ibgGZAbRpHlAmAdkXbXW2foJtL+Oa0DIAXRdRaaGyteCoa26cqiSA8927M9wgA1R10jX
         mtIynPyqpkvcJl+LQZQziHgj67qhdBdzSNmcT1GZ4dhIckz7WVh4L2584Ly1x64TZqca
         wqMw==
X-Gm-Message-State: AGi0PuZTo4t5Ee3DPUCau9SAw7TLZXgDPr7coRxiOIB6zpaYcJEIRicT
	X3HVHWXOTBurMqQ2MenbXOUmKA==
X-Google-Smtp-Source: APiQypKfq07WYuI1gjqaHY6InixCvTjqsxoT4edROVhV2FM+OgmlRGO6Z0GiltpNSxhQdyRymwvsaQ==
X-Received: by 2002:ac8:358c:: with SMTP id k12mr31157259qtb.38.1588102551472;
        Tue, 28 Apr 2020 12:35:51 -0700 (PDT)
Return-Path: <jgg@ziepe.ca>
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id p4sm14135294qkg.48.2020.04.28.12.35.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 12:35:50 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1jTW1G-0007Hs-Bb; Tue, 28 Apr 2020 16:35:50 -0300
Date: Tue, 28 Apr 2020 16:35:50 -0300
From: "Jason Gunthorpe" <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] What is a useful way to show changes between series?
Message-ID: <20200428193550.GX26002@ziepe.ca>
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2020 at 03:29:38PM -0400, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> What would be a useful way to quickly do a "show me what changed" 
> between two versions of the same patch series? Especially considering 
> that:
> 
> - there may be a different number of patches in the series
> - new revisions will likely be based on newer trees
> - subjects/commit messages/trailers may be vastly different between two 
>   series, even if the code is very similar (e.g. someone broke down a 
>   single large commit into several smaller ones or vice-versa)
>
> In my mind, the best way to approach this would be:
> 
> 1. Create a single unified diff file from all patches in each series 
>    (using combinediff)
> 2. Remove all context, leaving only -/+ lines (using interdiff -U0)
> 3. Remove all line numbers from @@ @@ hunks (replacing them with 0)
> 4. Add commit information on top of the diff

git range-diff is not so bad at visualizing this

Jason
