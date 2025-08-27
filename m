Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EA6273D65
	for <tools@linux.kernel.org>; Wed, 27 Aug 2025 20:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756326621; cv=none; b=o8UIvy4PpcgJ1fEa4uEz1EZzILZ6ijMTJ5K5vPZl+wiCK43IH/sREGHs3769SJZMkD3fLhoqyQider0IlLtoGs+G/8rnQqVELwQ9SZUmqnb161Ut/l3Mi93pLV722LsWejK9R3NkR3C25siibfuBAB3Tpj3nTa0GZe4RVw7wnBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756326621; c=relaxed/simple;
	bh=PRt5MmEWswOqgI33Hm/C5q7eu20br9z+K4ev6Vzg0gE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A7AaQY84ZeNWJ69zMq1j5j6w3gcEdjtcJTtucFnx3HLrmwvcL0l+4nOKGWguiqRKZhOhsoId0ixNsJdx73WTDp3FBSxRsYnmEKcL9okzMLVp8uuOTbs0auSKG9MyFTDvP7KVNG+xhmcsWUX1qstXLRBl1Rm7rOuCzLYLw3CkOfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hSyWBs0p; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hSyWBs0p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756326619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=ZQ4uKDasxY/4OxF8sk18s45qBkBEHrh6GJYWq90Qh6Y=;
	b=hSyWBs0paFqVKNy4wDGTxyRWCf2Dm19AMQZF/dc/TNSY8ShTc/CMu/87XowzaMIrdjAa2+
	NsOpraOvHUaIHwE98QPs7Ieqp9tFLgD4ucMpljPGtgYRsyQMaYcxWt18oQILaaoYCOgUyt
	I65uVUQ4Dew6O2L7FvCoTqWf+LP5YM4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-kcUY6DIyOHiO-oh88AQyjw-1; Wed, 27 Aug 2025 16:30:17 -0400
X-MC-Unique: kcUY6DIyOHiO-oh88AQyjw-1
X-Mimecast-MFC-AGG-ID: kcUY6DIyOHiO-oh88AQyjw_1756326617
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7f7dd47f712so113476985a.1
        for <tools@linux.kernel.org>; Wed, 27 Aug 2025 13:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756326616; x=1756931416;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQ4uKDasxY/4OxF8sk18s45qBkBEHrh6GJYWq90Qh6Y=;
        b=LL+7iCH7r/o9gm+PLrFy3vw1hfNck4Cs1FxUxvGZvw/NIIqfq07LxtLjPRwJjDQc7P
         GHCPej/+TLENwcMjkKzgVxJ6A9in+zRFmpNZvZ8nkx0jIlzgq1boiu5IS7XcqECTyqQ+
         awP1eEjjTrdQNBAys2/B/blLHNNn70Tk6trVXVIGQknuCgJRwoJPrKY4aN3gpFBA86Mp
         MapNnU7C65VhlzoQxPLjyqmIwDm2jI7exP6XBLWDMDKuGxu59BEZf0w8sn1U6NM0xDSR
         bFnSHjXk+RZVRTBlZnxbahIVsH5fzK9h4Ujqx5qtYQYHwFYCL4D0peOSdbBC9XAvlvK5
         uKgQ==
X-Gm-Message-State: AOJu0YyT2y6MiDtPnwsfqp+KULCmsNdGMM5DT0ixFfRs4Zso2KwOpj2C
	HznV2FXZRG2Ud2/WT/QVY2+UDAEKWtopornlNR3OMSSJP4gKiqZKZloi/2sjknNVkd1LtAGy6Bi
	WDcBzXpKxeuJeHgGhhxO57JSNE0kV3baUhdrkrpdfTp+zuC2Qy1Wv01qvL1cVhRegBZZ4t6uSs/
	cYix0wlysYmfAztaGy1PJuMHo+utgfaJhSnxwAwHAXgHw=
X-Gm-Gg: ASbGnctAehKgWXAE6d0gIvq9Cj3CBL9VmFjbSGE/05VRS4ADJInVWAZ/fCE7cpb7Nix
	Rot6b5/oEWMT7CrQD9VtEdLa80R9lUYL0J5/Ekhg4X/gLtReOsAYMvY+WJ8f1pQwnNHpUrw3ACO
	cet9vbDbpNmyBxuqH0MlPXYqDiUQxJiToNtIsLfuMnVhwD/QLVxXcMJEb14ZMgPWufAP68A6dN4
	dCqxQunJMoJrJuGHY7FMoArBaVtL1aPg9zL5+VdVeC9scATlmIghZZ6aRgTaYN+jGm/YdEKNC92
	xUAvLmM9gZwCE7yqBVJ0g2ba0s4RhF9cTfA97AQ/WilLuSmQlMLpqLTY+0kQ03CTwJrnqyruUmN
	2d/qyYKTOwlv7xcd3+3w=
X-Received: by 2002:a05:620a:4153:b0:7e3:4ef1:f583 with SMTP id af79cd13be357-7ea110202e0mr2126934785a.42.1756326616032;
        Wed, 27 Aug 2025 13:30:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAMItd2CWyx8OH9Tfby/uHpSu/PtyREJK5ALZIF1wz/iywwFfRVwMU3A5ZHqCqhs2O5ZNIbQ==
X-Received: by 2002:a05:620a:4153:b0:7e3:4ef1:f583 with SMTP id af79cd13be357-7ea110202e0mr2126928785a.42.1756326615389;
        Wed, 27 Aug 2025 13:30:15 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebf35f0b43sm940495585a.52.2025.08.27.13.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 13:30:14 -0700 (PDT)
Date: Wed, 27 Aug 2025 16:30:13 -0400
From: Brian Masney <bmasney@redhat.com>
To: tools@linux.kernel.org
Cc: Maxime Ripard <mripard@redhat.com>
Subject: Suggestion for b4 prep: new flag to collect email addresses on a per
 patch basis
Message-ID: <aK9q1S_Xvzof7IiV@x1>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MDPeSkG5UEeql3M5V5ljBw9WELOku38-XaQfpICwDJs_1756326617
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I recently had to send out this 114 patch series that covers changes to
drivers/clk to migrate away from a deprecated API:

https://lore.kernel.org/linux-clk/20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com/

40 of these clk drivers have entry in the MAINTAINERS file, so
'b4 prep --auto-to-cc' adds everyone to the To line for the whole
series. Most people only have 1 or 2 drivers that's relevant to them
in the big series, so it creates a lot of noise for people.

For big series like this, what do you think about adding an option to
'b4 prep' to have it only put someone on the To line for the patch(es)
of interest? So for example, let's say we have two patches that make
changes to drivers/clk/driver1.c and drivers/clk/driver2.c.

- [PATCH 0/2] clk: some changes  # Sent out to everyone. Union of all
                                 # email addresses below.
- [PATCH 1/2] clk: driver1:      # Only sent to driver1 maintainers
- [PATCH 2/2] clk: driver2:      # Only sent to driver2 maintainers

I could have sent out maybe 80 ish or so small patch series, but there's
downsides to that as well for the maintainer.

Brian

