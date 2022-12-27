Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501552F2D
	for <tools@linux.kernel.org>; Tue, 27 Dec 2022 15:58:53 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id w1so623609wrt.8
        for <tools@linux.kernel.org>; Tue, 27 Dec 2022 07:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5D8nEgc6HDscy+BsmBOIAIcRTQRuy/ewAvx6IpyH/fY=;
        b=Rgh/B1g+dk3/dMXWzBdG4PYrT31p9RUIeo8luw19ZfaHHDTXo+Qu0XZtYzgfwgJ3Mi
         FwBA0HZS0n1r52OJQ7HirXVgPRXFil/ckKFACUGzRJ9GoJc81ibmpAjndlr41xv2zK8p
         v6jIzQ2RmP7Ck3w3F7nFwfCjF+Mx/tL5VNZQysKd8lKxv9U1tswok7PLKHAIvPKw+lnE
         Md3ThLMj0532tIzYRTmgGYNXZe7Ye82R1uvpYpBOJhSXlao/rsu0OB5Gi4MgqkjeTTVj
         UC4NN4LbX/1WMGTpBMAn8W25RHAvcP/SnUhpP6FjE5uzqiWxUPWDqLugFuNdV+ASi5TR
         yVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5D8nEgc6HDscy+BsmBOIAIcRTQRuy/ewAvx6IpyH/fY=;
        b=kguZLXf7emHl0FIfifsMk3/fZHWVpLPezUS3IEIex2/OeMIsar0XhnKiugCteUtqzK
         RPGO2NdEFAXvUMqt0KY4PtSvjzcCAYjwQK4GvEEv1w1UuYzQn/138XVu+vvkj2Q3MfC/
         AgjEqxSfIqck/uWRuG7SBpjAkqTzPMINncSmrXQZile+Liijb0I5mHtITaEvw3E0A2vd
         MB5xXy70bNOEQbBPKFYpQkZr0MxPs2aEkYhKOr6NBR+eRoud9KQjAQPNbVdBuBoCzyvA
         GrNFyiTqSNNFZsPOm/X8snctVBPDZRXAVjs2/ozNKATcV5gXILmmZdG1A0kYuFlh+1PE
         mIDQ==
X-Gm-Message-State: AFqh2koXDQvS7t6s0mCXreZFLgxD0eMAJXKUxfXqciJoni1eudCxzVEq
	7DVv7S/b7HJc2YZ41+rr+1DUPeI63g/bsE2c
X-Google-Smtp-Source: AMrXdXsTPp1Cf01erdTZgrS+3utb3pXd073F4yOiEN9dM5N8dUFHlDaEZ0VCyWBtS5wqMgOPvF5YPA==
X-Received: by 2002:a5d:4dc3:0:b0:271:dd0c:8666 with SMTP id f3-20020a5d4dc3000000b00271dd0c8666mr11223812wru.66.1672156732049;
        Tue, 27 Dec 2022 07:58:52 -0800 (PST)
Received: from blmsp ([2001:4091:a245:805c:8713:84e4:2a9e:cbe8])
        by smtp.gmail.com with ESMTPSA id w12-20020a5d680c000000b002302dc43d77sm12932502wru.115.2022.12.27.07.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 07:58:51 -0800 (PST)
Date: Tue, 27 Dec 2022 16:58:50 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 prep -n ignores b4.prep-cover-strategy
Message-ID: <20221227155850.zcc6ywrjmwqgjrnz@blmsp>
References: <20221223170114.oairw4taqptkq3ou@blmsp>
 <20221227152944.ubsn5itf2u57jlsa@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221227152944.ubsn5itf2u57jlsa@nitro.local>

Hi Konstantin,

On Tue, Dec 27, 2022 at 10:29:44AM -0500, Konstantin Ryabitsev wrote:
> On Fri, Dec 23, 2022 at 06:01:14PM +0100, Markus Schneider-Pargmann wrote:
> > Hi Konstantin,
> > 
> > maybe I am doing something wrong. I set the cover-strategy to
> > branch-description in ~/.gitconfig:
> > 	[b4]
> > 	        prep-cover-strategy = branch-description
> > 
> > Then I create a new branch using b4:
> > 	b4 prep -n up/test -f v6.1
> 
> Weird, I can't replicate this. Something else must be going on that overrides
> the global setting.
> 
> > I verified the config variable:
> > 	git config b4.prep-cover-strategy
> > 		branch-description
> 
> The only other place I can think of is in .git/config for the up-test branch:
> 
>     [branch "b4/up-test"]
>       b4-prep-cover-strategy = commit
> 
> However, this should have been deleted when you ran "git branch -D", so I'm
> not sure why it would be left over in your .git/config.

Somehow it wasn't removed, thank you. I am not sure how I got there, I
can't reproduce it now. So, consider this solved for me, thank you!

Best,
Markus

> 
> If you can rerun "b4 -d prep -n ..." that should give some debug info during
> branch creation that should help figure out what's going wrong.
> 
> -K
