Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DAB4C61
	for <tools@linux.kernel.org>; Wed, 31 Aug 2022 19:21:49 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id j1so11836651qvv.8
        for <tools@linux.kernel.org>; Wed, 31 Aug 2022 12:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=3+Wy9dNp/eJ1V5ztUsYXNQ9roeQZ6L1U2N7ERn5Ha6w=;
        b=M0Q7wfOWpJWXibkLaF16o1H2KJTKbQClAoj1RLmVlhOxnIRVGhNjK6/VvQsFqqo7NK
         +FTXGycUA/Eprt/zbqdllHCA96JVHyUWxzINawwyOOMHKX5VNgBjuYBdLhwe//6QpYYP
         UW9ZV0DtOOyyKvrVJdl0irTBgCZs1sbzeztKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=3+Wy9dNp/eJ1V5ztUsYXNQ9roeQZ6L1U2N7ERn5Ha6w=;
        b=LxEEmxRYxGxQxVPZmDNaE7/1XaF1GeB/EGYFbi0kHmM/2OH2BEHwMBJrEca0TAVryB
         NL8wJ/fOfKju5XkPk9c13WRtkIucm2MNT07fdwcxYnvxKiJIRbcbvek0mLSrHhq3ZJdb
         ZaJ0195f3sl41mB3lesQqlSGvRShTGPCFFAd06b6rBIQRxmXzrvO7hzg7OXcV/L8ig9B
         jOcq5o8ZLjJ6BrTPI6nJHOY2YU4zzXPU5GXZU3xXiADVpgs4oWYDhhYGjkbLG36newhh
         HcP6ueWeXM0Ffrm13qGtZt9ZxwZEdJyDTL6KXj0YJCBf3ORIq2IqqXBdJyzvDJWPHWCK
         VKZw==
X-Gm-Message-State: ACgBeo3y7OZ9v2G3c3lWhEdgIvQ4Hef0U3rUXxF7O6jfn5puqH34ZdsX
	pu7S5jeuwdeA9bedfg3Wi6v47Md6QJOQ7A==
X-Google-Smtp-Source: AA6agR5Lhww1VoOKZkIycsrj+4BzvOxoMtBiZCJ3XYgRCAnHLuVFr09mYgpQIipEVAAlzTczGz1oLA==
X-Received: by 2002:a05:6214:2528:b0:499:1c41:8751 with SMTP id gg8-20020a056214252800b004991c418751mr4615196qvb.95.1661973708954;
        Wed, 31 Aug 2022 12:21:48 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id y13-20020a05620a44cd00b006bb8b5b79efsm11528617qkp.129.2022.08.31.12.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 12:21:48 -0700 (PDT)
Date: Wed, 31 Aug 2022 15:21:47 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 ty header encoding issues
Message-ID: <20220831192147.eu7fmte3be24cyox@meerkat.local>
References: <Yw+amkaanvEh22Zd@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yw+amkaanvEh22Zd@sirena.org.uk>

On Wed, Aug 31, 2022 at 06:30:02PM +0100, Mark Brown wrote:
> I keep on seeing bounces from b4 ty generated mails in the form:
> 
> <devicetree@vger.kernel.org>: host 23.128.96.18[23.128.96.18] said: 550 5.7.1
>     Content-Policy reject msg: Message headers can not have 8-bit non-ASCII
>     characters in it; Use MIME encodings if such are needed!  BF:<H
>     1.73333e-08>; S231310AbiHaMlF (in reply to end of DATA command)

It's not really b4's fault as much as the fact that vger's content-policy
filtering is stuck a few decades in the past. According to a quick EHLO test,
vger specifically advertises that it's happy to do 8BITMIME and SMTPUTF8, so
the fact that it then rejects 8bit after advertising it is unexpected.

I've pinged the necessary people, so hopefully we'll fix this.

-K
