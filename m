Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D5E71
	for <tools@linux.kernel.org>; Mon, 17 May 2021 22:01:54 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id i67so7409672qkc.4
        for <tools@linux.kernel.org>; Mon, 17 May 2021 15:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yMsxa5MCsvEU9c2pa3oxAB2KPmpiR2yeweWEqyhaoGA=;
        b=eBWCdhueHnaCA1Gg/AFiO3GtTRVQ/EwpaIOeVTH8cUqFPjDsUMruvzMsuooNAhn2FQ
         VqwJiCOdGO3BTI8kzvfzKYk3rSiMOa02+9FM3HFtg33Z1hyx33aSdzAD5+iISdZTYlL/
         OsicZmhs9dKY1D8D8IQ7fDx3MDmXDUdRPmQlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yMsxa5MCsvEU9c2pa3oxAB2KPmpiR2yeweWEqyhaoGA=;
        b=Vjdvp0rKQ1DR/MgTAQoXQ0zgzdLLV6vzZVgweJTWNbVBA983wt0eb+D4QG6Md4LFpu
         PftsguteC+Y89JggH/rUd4ofNHxtRfY9ssTZta8Cf85fph/n0+SLpEcIATjVWJvbu7ia
         hrCmgnp7urvLr3eL/ptoHtgzle6AfxL1dH8IeU8dTIxyaA0MWK/rDVMj2NtA1EdtC63B
         TVLnXTkCGQNjjJFnu5mI/RzSif8gFcdm7VwGLwp4+CDg4j0HxmeaMxqsN7/fadZFZS8O
         VEkv86adjeAH/oAiVHC02okHKfT6EbaPERltPEVKSNwc7cyhGytIiPdbAgQHirCQoLf4
         7VnQ==
X-Gm-Message-State: AOAM532ZvZ0nNHJfnYXVBVG99B1H+NklopYNLf1/L6Ixs0YVbYpTv0SL
	9Zko+5wcla0ux2vOqdGuAZcdAg==
X-Google-Smtp-Source: ABdhPJzGOrQFpVfgTVs5MeCphwTCNounzWfCQuMKpG5+TrMSvIEKOxuPDDlz+J4AQh8ABTsBWv3cHg==
X-Received: by 2002:a37:9d58:: with SMTP id g85mr2071229qke.426.1621288913606;
        Mon, 17 May 2021 15:01:53 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id 11sm11427802qky.71.2021.05.17.15.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 15:01:53 -0700 (PDT)
Date: Mon, 17 May 2021 18:01:51 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: tools@linux.kernel.org
Subject: Re: [REQ] b4: Allow -m from stdin
Message-ID: <20210517220151.b2bmt5f2jjlgmkos@nitro.local>
References: <YFETLu8TKWI2WlSF@hirez.programming.kicks-ass.net>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YFETLu8TKWI2WlSF@hirez.programming.kicks-ass.net>

On Tue, Mar 16, 2021 at 09:21:02PM +0100, Peter Zijlstra wrote:
> Hi,
> 
> Would it be possible for b4 to consume an mbox from stdin; something
> like:
> 
> 	b4 am -sl -m - -o -

This is now supported by b4 master tip and will be in 0.7.

E.g.:

    curl -sL https://lore.kernel.org/linux-staging/20210517155733.GK1955@kadam/t.mbox.gz | gunzip - | b4 am -sl -m - -o -

Best,
-K
