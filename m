Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B39E277CA5
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 21:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760562436; cv=none; b=sWU6uZJvzW8M5XQji4WKKB2IipzqHWNUTwa/83HspHn8mLPoa1j0keiSE3wfiGjhobRuMQejZymvy+tMYj600knxAz2uYKjtMtTusi3tikqdEWDbDzokzYcs+cUQ8jor5BpgnjBIUX+9UvPBeHgyH2sZPb2OnJqrKmex6dEXnGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760562436; c=relaxed/simple;
	bh=XySoW7bczOHFTu1LInw2WkTkodbpYSWdrWyuGS1r5eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fYk+NezRcBWPxpchcxgAjdxAiSl7+boxmJTT/+U9j80IVHT7ZhypX+ah3tDTTALPeZU7g3FbhFi3J+72Z92P7RfW8ipJEnCPmqZi4T0tLA4XdoRtmtffT6aLpKzH71bqwpfRB+xY0bKgn0zjAiA4Pqqv/L05kqMTVcTBtLzaYyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AsSPLnT8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AsSPLnT8"
Received: by smtp.kernel.org (Postfix)
	id 1BD30C4CEFB; Wed, 15 Oct 2025 21:07:16 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06180C4CEF8
	for <tools@kernel.org>; Wed, 15 Oct 2025 21:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06180C4CEF8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760562433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4QrxRH109bSYMfRZq1IRD84YKV/+KP3PXwFjWP2GgaI=;
	b=AsSPLnT8+0JnuTHcprZnN9xV8f7m3HtG+l5gb3+/dTc50Jj0RKvIrYeqWXFN62aTjUZANU
	tFTFSPxvxQrO0uR6CnwHJ9iobQwxK3ehl/AccMIGfOYv/3sbKiToHvX/R+4aSxIoTObbSO
	/+u9IxFwuAv8pDlIfGV6ttJNzVUxR/M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-vRlz2tisPzi6dVKp0U9AXw-1; Wed, 15 Oct 2025 17:07:12 -0400
X-MC-Unique: vRlz2tisPzi6dVKp0U9AXw-1
X-Mimecast-MFC-AGG-ID: vRlz2tisPzi6dVKp0U9AXw_1760562431
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3ece0fd841cso23179f8f.0
        for <tools@kernel.org>; Wed, 15 Oct 2025 14:07:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760562431; x=1761167231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QrxRH109bSYMfRZq1IRD84YKV/+KP3PXwFjWP2GgaI=;
        b=CfMKLDBPn+ntRYXow/NItQo73jhTmHgWuK5hr6fkJzeUK4SKXVGGgpBmugH/7jJY2B
         +XVQpcrHSRR/aQCw7uEuIAFAnkgqW1e3Yvzqb4kWnFV4tWJAmRFgIz816nyGI7y2OSHB
         2HZQZkkd4cDyNtngAkgJRDlkIUXxOVZi6axNgavG1sle7KH3YYWHIjXNrVKqWyr6U4Uu
         oyzzWWwXzNMQ8UY0dvQdXlvd47M9jC923xFzAkOHaTwPEFir/+/vPMbMLk4ILPYNVij2
         VCuce2YyvzJMcNhaKXcfRnvV78l/vWONwcHhVlCVmhjXrrCjoY26AF9qG2H/o/tItvqo
         KESg==
X-Gm-Message-State: AOJu0YxaUyosk0EGRicQNBm/9Zav1jgsCcxkz5u7R8uQyOTBrAQcNKya
	03cggjCvSQfJxHhKk8RN+Gbv/XOtWq/Rqq9AMaJmC6p3Dv4W4cTGeO3oJzEYQuEXvc93t/p1qHJ
	4gLK3zzlBRCVyCK34TIxzJH/8R1gY04G6UnhaZT4YSvC1z3KwPHqtet8GvHeAH05q8XEYUwhH4s
	Rj0824zTxTQokhhe766R3shGb4emw=
X-Gm-Gg: ASbGncvh/6WSGkpnHWgZ1cGCgDNlDhaoM0iyckFmUnYqX0FjmlmuhDG838v3CbaFj8w
	MRA9ivVPnz0chB3t80rtrp9oVW6iFi80EsFxT36WBwxn8hkhvsOnQHuh44havFQabwviVopVAp6
	ceLsi2EK7aIsi8sNvrlmOHY6V1kLzkE+BZ550NCxU6c5YsQcQgKAFNuHFvgNU+RB0OSatDmmNxa
	GFvG21tvsSKPzczY95unRZsmfF9qQ+UNd0TGOuFHizzszf2crF2HbeFHXDD8jBsxY4b8JKtPafL
	4Xo+Z5rErGmzFeCoFuD6OJcgoLyneDXWQL54N8k6QpCiIdF9vPg6s+HcExVvf2fnQ+tF
X-Received: by 2002:a05:6000:1845:b0:3e7:6104:35a8 with SMTP id ffacd0b85a97d-4266e7dffccmr19504285f8f.35.1760562431024;
        Wed, 15 Oct 2025 14:07:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaOyRIJvWq39K1ivk9M3roahATSbhNjo/3xk4/pxFMbWZPPOvXxZN7WF1s1NVYyiam4R1LEQ==
X-Received: by 2002:a05:6000:1845:b0:3e7:6104:35a8 with SMTP id ffacd0b85a97d-4266e7dffccmr19504266f8f.35.1760562430468;
        Wed, 15 Oct 2025 14:07:10 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57cc0esm31108587f8f.6.2025.10.15.14.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 14:07:09 -0700 (PDT)
Date: Wed, 15 Oct 2025 17:07:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: tools@kernel.org
Cc: konstantin@linuxfoundation.org
Subject: Re: [PATCH 0/2] b4: sparse-checkout related fixes
Message-ID: <20251015170619-mutt-send-email-mst@kernel.org>
References: <cover.1760393880.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1760393880.git.mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5y9fB6WZNzePXlzBz09e_rgE4F8sCEXzpYCStnZMhg0_1760562431
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 13, 2025 at 06:20:06PM -0400, Michael S. Tsirkin wrote:
> I encountered shazam test failures, diagnozing them I realized
> b4 misuses the sparse-checkout command.
> This patchset cleans this up.
> Pls review, thanks!

Hi Konstantin,
Just making sure sending this to tools@kernel.org is
the right thing. And do you want to be CC'd? Thanks!


> Michael S. Tsirkin (2):
>   test_shazam: clean worktree before git am
>   ez: cleanup sparse-checkout usage
> 
>  src/b4/__init__.py | 6 +++---
>  src/b4/ez.py       | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> -- 
> MST
> 

