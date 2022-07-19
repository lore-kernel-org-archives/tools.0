Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBB21C08
	for <tools@linux.kernel.org>; Tue, 19 Jul 2022 13:09:39 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id mi10so11011903qvb.1
        for <tools@linux.kernel.org>; Tue, 19 Jul 2022 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=A+IVkAfCztuZQT1i11xz21e3YrxeixT6GSiVAWax9ro=;
        b=T9jfSZv7POMe/lh4mUkmVQ+hCXo2tIwkbORYvVzRcaY7x6uqz69DogWGX1WnjNIU/m
         mCHOj2kg9p+Gn4CdB3X91zYWLISqXzthcugnZnOwN8R6/SbyMzBFTY/4+fkOAv7ueKHS
         /FtkGE13DUdUvuHma1rEk9HRDoA3EXP6+8KB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A+IVkAfCztuZQT1i11xz21e3YrxeixT6GSiVAWax9ro=;
        b=7mIRXaAc6kMcmqZEkahY5Vmr5OlQbz501eXHeF2Zvs/8JwzbHaZO8N0pq3LhSm4KQQ
         fs8YscauMh83ZaZYCFHHIA/xEBccv8ucx6rXxQdO67R+xrREayc2XRt2ANmNZFuZ6NVg
         T/ihJOsZ5LP/woM4PzeE21I8ULltmRxaFcdc0OMHzKxPLKotveMGU2S/iA3FbyHXPejO
         LHkFxF7mNdF3f9/5wZa9GfSiKe9IF8GfvITAefT32Ry260XmDGzvKJNlRVJ9XGiWGa93
         R8YFb7tm9Ygb9MCcx6D3LxD59UDxpEJg6SkVC2nis52Gqobp1WYaNC9cG7DnM9wKjFhC
         9WNQ==
X-Gm-Message-State: AJIora8C+V2515J53+9J8PQtGZkg1djJn7C/s7mEBCV+iighT10WsA93
	IjE/bzZJ56q65zfimxbsz10CQA==
X-Google-Smtp-Source: AGRyM1teMVx3dVuSeBzFEXlnD8APDO3/PDGtW/yGvTrLba1D7K3R7RTE84iAcSvL6LfEl3E6MQd29g==
X-Received: by 2002:a05:6214:5297:b0:473:7607:3ea4 with SMTP id kj23-20020a056214529700b0047376073ea4mr24954415qvb.28.1658236178345;
        Tue, 19 Jul 2022 06:09:38 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id br38-20020a05620a462600b006b5f06186aesm3961090qkb.65.2022.07.19.06.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 06:09:37 -0700 (PDT)
Date: Tue, 19 Jul 2022 09:09:36 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220719130936.h7jitpwdm4kj6sdl@meerkat.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <87ilnti947.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ilnti947.fsf@baylibre.com>

On Tue, Jul 19, 2022 at 02:23:52PM +0200, Mattijs Korpershoek wrote:
> ## using b4 submit -o, we see that the order is not the same:
> $ mkdir b4-submit
> $ b4 submit --send --no-sign -o b4-submit 
> Converted the branch to 3 patches
> Populating the To: and Cc: fields with automatically collected addresses
>   0000-cover-title-for-patch-ordering.patch
>   0001-newest-commit.patch
>   0002-newer-commit.patch
>   0003-oldest-commit.patch
> 
> Is this the expected behaviour ?

Hah, no. I messed up. :) I'll fix this in the next commit. Thanks for pointing
it out.

-K
