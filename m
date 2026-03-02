Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D0432ABCD
	for <tools@linux.kernel.org>; Mon,  2 Mar 2026 10:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772447646; cv=none; b=M8o6pjTn1LsmkLKZmpVI4Ml+/BC2YKdmnvx76seMUjKGdw5vF3XxnTAd6x2/iareEUN9fCFXQSvvqzvURBKp5wcS5LXOtY6Z3LivTRMCHF0wZpv/zUQOERmBrg7hT1quPXN6ff/+jZMyVpky0sUK+2O7wsQFObIj6w+GZNWD05E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772447646; c=relaxed/simple;
	bh=2RxyZCvP1ymnm96FNUWMZ8jQcVx64Xjgh5Ij1fFp3bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fr7vq1BqsC9u6NrMAjDv8qbVmoJcH6n4t7P0YXIXsXexAiHqJisfiAvYVL3LYPbatGbLXDs851GmQGYRo7J0pkaAN7AD/Ar/htgr0RKTy097Tt12wXzn5VKNWklwlfGBO8M1D4bb0rUMhPgC8TYeMUEu/0TtjQiVUPSYcZyrBaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CyyVdyAS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CyyVdyAS"
Received: by smtp.kernel.org (Postfix)
	id 1C6DCC2BC87; Mon,  2 Mar 2026 10:34:06 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 010D1C19423
	for <tools@kernel.org>; Mon,  2 Mar 2026 10:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 010D1C19423
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772447643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BdtlHQ5Qug6UZvTQFOC241F/A+7g4cQ2rCnNKMah8lE=;
	b=CyyVdyASr8P8Mvo37ek5Moaq13Kh4zeifeMXJ0/v7KneJ0rCvWk2oEouu4Q1hJohF4+f/z
	hqyohBhGBesfHrICzsmbO5KLSPq209QgLHpgdNqH7XQBjO/Wjpt/3W1WT9tVByH2lP307h
	qcktntcoaIJdn/ZjLSJf89s0D3obYGU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-EK3WXT8rPQS1cHNHcjzLZg-1; Mon, 02 Mar 2026 05:34:02 -0500
X-MC-Unique: EK3WXT8rPQS1cHNHcjzLZg-1
X-Mimecast-MFC-AGG-ID: EK3WXT8rPQS1cHNHcjzLZg_1772447642
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4839fc4cef6so48410905e9.0
        for <tools@kernel.org>; Mon, 02 Mar 2026 02:34:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772447641; x=1773052441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdtlHQ5Qug6UZvTQFOC241F/A+7g4cQ2rCnNKMah8lE=;
        b=PqMzGCLN1e8UaTqB0AiW0/3eZvLxQEWia4OrIoIRSSbwdMxKKFCZ+SKi4W1XjUh9OC
         AhxKVyB+CJ+Dw4o7YqOgLfRvAOGHtK2TDuHfMEf+zsNQDaNEcIKl5lIyITrunXwMyQGm
         8IdV6ZWKbgDgDORF6Aev5uCRwqkKLfGxQCknk2YB6dZNhimu8nXWTUgrayAURsxWBQRt
         zlsOVUMZ3Xm7xCtc01emV2lW/igQE3malDw8Sr75c+3oRTyk9FKKaxn65UO1hBUbdKv5
         Qr9ZczOvAi6W4PhSUV4dchv7AMndW37w5lXnHvSOkmw/535FEmJcotyzKQapC0ZPw068
         +tOw==
X-Forwarded-Encrypted: i=1; AJvYcCUbssVCWf/tHnRW9/VpdbEKgeYI2xJqILLNcApo272xmg6ANLbOSa/kapNS4/HL4mdEbTlJLw==@kernel.org
X-Gm-Message-State: AOJu0YzurU/7qGX8IKz3UJWt6cTSyzbEnKeONIxcLeuS0vPXBX8V7Urk
	y4A4Hqy7DUUgGvUTn9DlAmfKcSRzfz7AIcBagX3g9KlE8xCXQxLTK7/F6xDSWk3mJU00Cjp/wH4
	smdIF1yPew5Mx3I4u1luwz5QLYOleDgVsJHL746PEtsSFtQxUng==
X-Gm-Gg: ATEYQzxE7vtQJ8kuT27NKrg0X8BKYbrcxpGWEzHm0cOM8JcQ/m7FXe4BZX7MnxqF5wT
	UZJ5/IV8s/Gj1tedtYJU/0XTxg0Ddfyv4V/XXqihb9HOI8dPBTkkiCQMEITugxtDKMzchwSSDqi
	cJzuINz2dcrNXuEy89iIYOiS6V2HcNTeWM2pHLuG7hh83GS3vP+jA20pYpYEJ4cWO5YiZOO0i7A
	4CUlJ989QDBgVjbQQYMd8p/kDvMR7Bw+Og2Y08g6ct5yQ1p6Hcbt/s5Yhdbm7R9JOQXukLg3X65
	RXmN+dRjSIMuXntxG9S6D/zg1YBIf/rMNoB1w82SuySjh6Ta09ezLJoai8xzUbEgpi5lnExs76+
	CbsBFb4XChOF9Zv7Fz4dGeJ1ENmBx9sIgZVAjpp27lVKWXQ==
X-Received: by 2002:a05:600c:1d21:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-483c992e3d8mr213540175e9.11.1772447640275;
        Mon, 02 Mar 2026 02:34:00 -0800 (PST)
X-Received: by 2002:a05:600c:1d21:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-483c992e3d8mr213538885e9.11.1772447638751;
        Mon, 02 Mar 2026 02:33:58 -0800 (PST)
Received: from redhat.com (IGLD-80-230-79-166.inter.net.il. [80.230.79.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b84023sm279623005e9.12.2026.03.02.02.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:33:58 -0800 (PST)
Date: Mon, 2 Mar 2026 05:33:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260302053240-mutt-send-email-mst@kernel.org>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260227-imported-aromatic-guppy-ad3dca@lemur>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IxsmM5QG0UnXVFCKVkMRFDUpJ2tImZWafPa1y2wQHW0_1772447642
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 27, 2026 at 02:53:07PM -0500, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> TLDR: "b4 review" is a terminal UI that hopes to streamline a lot of
> maintainer duties. A getting-started guide with screencasts is here:
> https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html

I tried:

b4 review track 20260302090413.86471-1-xuanzhuo@linux.alibaba.com

but it is unhappy - no commit there.
Add an option to specify commit manually?

