Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6778A2E2840
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 22:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760394014; cv=none; b=EGYVpB/NTn7cwHmGuxJ/yA7qdKOaLjxRjBFWVTDCDwSaT/rr12XiM4oqkWt3AjG+y2je31VmJDeCUE9GUtgxIEGa9FVpJXN/H1SuNxUQDG3BYVP/DbDniGLeahjbuSpN9ni8GY+aQ52ajiN4JKRe6K0RsJ+aryDh/62jWk7HQYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760394014; c=relaxed/simple;
	bh=E5JwaZtPLAAHTW/AZLmlI/KMWUL3RMR/JpRk4h0JVN8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CXT1yPWvk1O+4NUJ36KIL0fOCRyAIugr5eR+/l6nWWl4PVTsQ1erHlzMOuvL5ZWnMMgxUNcYsSlBcRfJQJe1RwA1BGelpUQNcEezmvMpI907D2l55r9mtz5uONRU1OzP5ev7dbEEkKplBQ10mdhyJDaDzBXdZoVPNveWo9UGDFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cn8Nns7j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cn8Nns7j"
Received: by smtp.kernel.org (Postfix)
	id F0CF7C113D0; Mon, 13 Oct 2025 22:20:12 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1BDC8C4CEE7
	for <tools@kernel.org>; Mon, 13 Oct 2025 22:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1BDC8C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760394009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=hSxCcI/G71R3qSE9Kqk9iui2Cwz6PXB0iKQNd4xtZWY=;
	b=Cn8Nns7jcEr8xCjDfoZ18J+SrCM7MCBy6Z0DnuqG0UDjtS8gWA/eixe5p7lzaO4lY2Zruv
	w2Lj/tfDWRE4SrcMD70YtZ63uI+QKGPKLQ1OgSuvGnVWCWQCgM+f8Ml+3qrvrcNYWyMrzI
	xkcMlef1/WEgSmj0pykubnjNJcsMl/k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-GuBlhWvWMM6EerYCnW3rwg-1; Mon, 13 Oct 2025 18:20:08 -0400
X-MC-Unique: GuBlhWvWMM6EerYCnW3rwg-1
X-Mimecast-MFC-AGG-ID: GuBlhWvWMM6EerYCnW3rwg_1760394007
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3f6b44ab789so2766209f8f.3
        for <tools@kernel.org>; Mon, 13 Oct 2025 15:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760394007; x=1760998807;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hSxCcI/G71R3qSE9Kqk9iui2Cwz6PXB0iKQNd4xtZWY=;
        b=tUSIMEF5G3hKnlKJazpzxokEjuP3Sq2OfvDaHmthNOQVKeEzBbNBeczJ2kJVMVSZYU
         DhLxkeHvWn6EvzBn+OA/+5RDsZSiMmshjYA7Va4GBy/zsCRM0GbJg7sqp+9CLV/IOTBz
         X0QGAWoNPU7qqQA9sCeZBr/LEKjhXdN/W//pjtGu8Hgnpa7nqFoTB/dQcIfOrp0j9JUA
         l7OxEOWGtjWDCNkX4WAKq5iiKEYdg8RJfdN/Xs55JIzegZ4IghXJkuT8T0sqJW1BKbWd
         qFhD8su18Ji/GNImLNA4jaciaYJ9Tz3Y2f/cW6gQi1Hea5GvFYcgKO028Z73rHgwowB1
         6Y6w==
X-Gm-Message-State: AOJu0YyxLR/jBICOD1atFeP6p4a6sHYFyidZrnFHkkBtzC4f1fwhqrjG
	ZxKvi1GliNo7OQPkKbHFeCYVN52r/PXnJg1mRDhHOi76/cYPvhnJqP0M+lHa0LRtAUDGIpXfiUh
	2NhKFr7+xqUSzuPoEIWdO3IcfoikRobDCgEoGRwv5yZebMFKqXjpszkRPYPEwWvMwBMQME7+jrc
	P0WfOEdyd23Kicrkb7h/8xypR6qWm1bA==
X-Gm-Gg: ASbGncs8L+E2AM2jRfx1XdMsQSHmi9sEXYbhIaPpuVrGLvk5he7cWopyUOMOZt20zrZ
	4wSpVKIolgbJN4lbJUJQR5K2U6ZDh9IfdHcbIoacgv2rv5XibpCpQQ07Kn2dnB6ow0qBG7LM+r+
	K+NYozATOVl8mdg17Vna3kLQodaB7dDlN4/fhPQZqYXoq2bN/3JqO8T5OAVF404w2KUTOHY8twV
	Ae8XG2esDu2BTFfgWasjjXRKr8obKuCBRvl0Em1FTFhxLni7KmjurkOO0ag9s1P24tW2VExV4GN
	CgzUyfOLBRe6BtpdVg63GGia0p6mh2EruA==
X-Received: by 2002:a05:6000:4917:b0:426:d3ef:6898 with SMTP id ffacd0b85a97d-426d3ef6f0fmr7278434f8f.15.1760394006853;
        Mon, 13 Oct 2025 15:20:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9i1r/EtzB2DbHccbfo/3qv2fHm4/G+6SYXrowb7ybIdtLq3QiNWRP55yOaKk0MPPrXLCHbQ==
X-Received: by 2002:a05:6000:4917:b0:426:d3ef:6898 with SMTP id ffacd0b85a97d-426d3ef6f0fmr7278420f8f.15.1760394006322;
        Mon, 13 Oct 2025 15:20:06 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb489af92sm223547085e9.17.2025.10.13.15.20.05
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 15:20:05 -0700 (PDT)
Date: Mon, 13 Oct 2025 18:20:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: tools@kernel.org
Subject: [PATCH 0/2] b4: sparse-checkout related fixes
Message-ID: <cover.1760393880.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Dky0KmoZ-VO4kY27jAfxPLPK3i5sQ54JUCBpe3jhBkU_1760394007
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I encountered shazam test failures, diagnozing them I realized
b4 misuses the sparse-checkout command.
This patchset cleans this up.
Pls review, thanks!

Michael S. Tsirkin (2):
  test_shazam: clean worktree before git am
  ez: cleanup sparse-checkout usage

 src/b4/__init__.py | 6 +++---
 src/b4/ez.py       | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
MST

