Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A336D00
	for <tools@linux.kernel.org>; Tue, 13 Apr 2021 20:53:53 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id v123so11626757ioe.10
        for <tools@linux.kernel.org>; Tue, 13 Apr 2021 13:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=zyhEcZtJhVXbOdTvJE1XAoPLFm00H6iLrr/mcbOwOLc=;
        b=gVaA/H1Hpvu4e5SxlX+upEPu/m6lCxlxh99nN6OUu3yPtJiY8XfI1XsX7yMEDYPy+9
         hOSEmRUVNKLd23GDNdaiB2nO5wrDOnWA+E2/EQ1V+3vvz322W/EMglYyx+aenrfzChf7
         iSl0kOgIqrfX4fa1VntEBE07Wks7098/So2tI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zyhEcZtJhVXbOdTvJE1XAoPLFm00H6iLrr/mcbOwOLc=;
        b=NhgvH7C5jyb1lkHche05/md+xgexh8Yve/VeHvq3UvY+LI+rw7Ik7U79epsPulRw26
         n6mMxo+meqhOoTTNWo3TbN1bD6gJPURqjs+08wJ06gLJVwKWjvcoOOK1IkA7Q9tzF9c3
         j18r4CAPXE+83dSMzAcsr/hE4RRygOzHsz2CvKAczy0XIlcYqhXYeSy3rObOXOZeiJ6D
         2vTB5LLkgztN3PWb/xvF5MhxgAGbcqqwsET71rxY3ttnHv6FSw1bnpC0a28kCNfw9wIV
         5wQJlklvGZ7PwZvb80+ET+CmSOyez8nVmVRepqv4onhrgbFdFonHWB8UdFo67rhpHYHd
         iSFQ==
X-Gm-Message-State: AOAM532eDUC9CEtLlx/4B07GyyxJeWpaNrR7Ef/Dg7IJmIJsyoYrY6bU
	S8qgBC1BrEqh8JtCg+/iZd2TErwvpgveqA==
X-Google-Smtp-Source: ABdhPJzDvDFGXFQPgnrUc7Hc4H7P5Illy1855lt32GrBTbmQTDMLgR6GYmV6IaHEVpzyF7WBH1SFQQ==
X-Received: by 2002:a05:6638:238c:: with SMTP id q12mr35939488jat.114.1618347231834;
        Tue, 13 Apr 2021 13:53:51 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id b6sm7297090ilh.82.2021.04.13.13.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 13:53:51 -0700 (PDT)
Subject: Re: RFC: Superseded-by: follow-up trailer
To: users@linux.kernel.org, tools@linux.kernel.org
References: <20210413204932.yovoa7njwc56jo5v@nitro.local>
From: Alex Elder <elder@ieee.org>
Message-ID: <fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>
Date: Tue, 13 Apr 2021 15:53:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210413204932.yovoa7njwc56jo5v@nitro.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/13/21 3:49 PM, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> B4 (and git-patchwork-bot) try to deal with series revisions, but the process
> is not infallible due to needing to guess whether one series obsoletes another
> via weak string matches (subject + author). If v2 arrives with a modified
> subject than in v1 (even if it's a typo fix), or from a different email
> address, then auto-matching will fail.
> 
> I would like to propose a "Superseded-by" follow-up trailer to help strengthen
> the link between series revisions. The trailer needs to be sent as a follow-up
> to the cover letter or first patch of the previous series.
> 
>      Superseded-by: [url-ending-with/message-id-of-next-version]

Could "Supercedes: [url]" posted with the new version work?	-Alex

> 
> Example:
> 
> After submitting a new series revision, a contributor sends a follow-up email
> to the previous series submission, adding a single follow-up trailer, e.g.:
> 
> 
>      Subject: Re: [PATCH v2 0/2] frobdrv: reduce frob latency
> 
>      [...]
>      > Please submit a new revision that fixes this problem.
>      >
>      > Nacked-by: Maine Tainer <mtainer@example.com>
> 
>      Hi,
> 
>      I just submitted a v3 with these fixes.
>      
>      Superseded-by: https://lore.kernel.org/r/foo-bar-3333-1-git@example.net
> 
> Of course, I don't expect a lot of folks to remember to do this, but I hope to
> incorporate this into the upcoming "auto-pr-exploder" tool that helps folks
> turn pull requests into well-formed patch series. In the same vein, when
> git-patchwork-bot recognizes that a series is superseded by a newer version,
> it can send an automated follow-up to the list to help indicate to the
> maintainer that a newer version of the patch/series is available.
> 
> When b4 encounters this trailer, it can issue a warning to the maintainer that
> they aren't retrieving the latest series revision (and can automatically grab
> the new one if instructed to do so).
> 
> Please let me know if this sounds reasonable.
> 
> -K
> 

