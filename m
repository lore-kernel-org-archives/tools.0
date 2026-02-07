Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4009C32570A
	for <tools@linux.kernel.org>; Sat,  7 Feb 2026 10:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770460818; cv=none; b=s83Y8J4GWW+L3vz3FDQYZMy5LT+r6ieMpUZh9Wnwotkqi4dNx1dfgz8tCauRkz439wmfdIUReiTBHy9Twwp+Jjp8gdBuXn+2xZpiM1abS5gRduGCXyrFRcrlcT4YVl8EXDzSmPr0RGfkfrkV6VHxu0/WlLnCf9vwwyRucIpPun8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770460818; c=relaxed/simple;
	bh=lB4AOpiwmcqde05ZdaGTaN63RFPI6j4a+y0fWVqovDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G0RjaVxjs8xjlzwxRlL7o6IUBCdKdsMlVuW7goryMLt4WmgmpodgOOQ2aXalh5Y30NCu3qXBwzPwNo5q020JLlplZe07NQkQRqIyyf4xIk3IxudFLL483qs1y8A/ZJs6+ukj4pqyV8ElQV9g5rUlJsoEKht5NKD3rv90r8nJ9ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gl1yrRzx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gl1yrRzx"
Received: by smtp.kernel.org (Postfix)
	id ED408C19423; Sat,  7 Feb 2026 10:40:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C55FC116D0
	for <tools@kernel.org>; Sat,  7 Feb 2026 10:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6C55FC116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770460815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Ap86LHTA0znMnuWg8S3nhgXnJpYbBUHfnWs2W4wD1X0=;
	b=gl1yrRzxNBsvqj2tF8++ixkdAi89lAHmPyo9izXJNO4sDIpHs3wmKyk7gHeKnRGeowNkoB
	CI4yLVB1RlKAmFrvUpea9Rzo5+EmJQkj7EZXcLXIoCpJYl3VYEB1R6HOtVGFPD1OLgPeh2
	Mx3+bKNAutUpVzNNYIUNUD+YYqpai4A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-cGmNwSB6O8i9qoLCX_iWcw-1; Sat, 07 Feb 2026 05:40:14 -0500
X-MC-Unique: cGmNwSB6O8i9qoLCX_iWcw-1
X-Mimecast-MFC-AGG-ID: cGmNwSB6O8i9qoLCX_iWcw_1770460813
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43624564fc9so1204534f8f.2
        for <tools@kernel.org>; Sat, 07 Feb 2026 02:40:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460813; x=1771065613;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ap86LHTA0znMnuWg8S3nhgXnJpYbBUHfnWs2W4wD1X0=;
        b=NMbrs+bksEXiSFCnu+wXvHzt5l7YvWJwT7TKOS4V0EG7II7NDVzpkUWZoXRNA8QGxa
         VuuWbqUGroWc0UbunlMSth1LEiFcfPeE9xWcB6Yl3MsrWVRRJi3SwSqwY6769MBOVapp
         ZiIVKkpmzHoHhNRi4e/aYiSg6RJ9bOepRA/PQ5SaBlfPsQvmruPGli1zy6of9NOlgs+s
         UrRDze/hARa97NrF1RD4JdadkkzVH6F/m5Mdcxfmxccw2pWdYWVwhp5gYIUygd0WWQ3F
         usewiQW6f8KukqtCslFvPvpWt2Opmm7IDWDXdpYjHkocX//wi/KeTevr+JW433Gz9Xwr
         Q07A==
X-Gm-Message-State: AOJu0Yw7JIt4dYll4AYe9WH+3yttMiYJNAlEZauRgXeMYq5lJ2fhM68X
	hon87FGPLfkhU0gecFEDcb4VKQMZBnKXkSPLEe1QFc3Yn1tyqu2h8sP7PofOY2PcUqkljELmIUE
	d27E3IwaOdyaGhidE6Aah549WkQzpIPWrRzih7QaasmSM9jTgRxmvHVvfo2PhoCkip9ghHWu5zM
	0mwK+gJKvx6nJZUsOgfvfs+ShuJ8w=
X-Gm-Gg: AZuq6aKFYc3NnHYi5v5+5KHyV/rhETeJiD2w+HwI4I8RNTH3KT9dcSuTgYuVG3QwjGK
	zGPypqw57V9g0nEoguml97ypsF6UkSw+yXQpRyqTpUhhx6Lnsa4/q6pPR1srNw2070yj5qOsGPz
	PgoVWfV+mRNKswyfo862Z4sGcGXgFmGjzIkxt7XbXdhpHkS1LPI9e4Cv9QnuikTR0TaqZqF3Oix
	1Z8Q0KIVhofCoE1gmkmJPmjEtKgFeu2vj33jfEplzrHQEixQ1kyvTNqUbsJZ7oEbRS5Obge8CqJ
	84XqqIEna+sYhp9VhZ5BTkYoK9RUyJwWRJ2wEP3niXy6qjHwY5XTE/nEsMwXqoZMTGEtDJC12ME
	1iSKH/ewH9FVNEvghzXHwxfCWEsRf7vt+bA==
X-Received: by 2002:a5d:588b:0:b0:432:5b81:480 with SMTP id ffacd0b85a97d-43629341fdbmr8724774f8f.24.1770460812697;
        Sat, 07 Feb 2026 02:40:12 -0800 (PST)
X-Received: by 2002:a5d:588b:0:b0:432:5b81:480 with SMTP id ffacd0b85a97d-43629341fdbmr8724748f8f.24.1770460812240;
        Sat, 07 Feb 2026 02:40:12 -0800 (PST)
Received: from redhat.com (IGLD-80-230-34-155.inter.net.il. [80.230.34.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629664632sm12114259f8f.0.2026.02.07.02.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:40:11 -0800 (PST)
Date: Sat, 7 Feb 2026 05:40:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: tools@kernel.org
Cc: mricon@kernel.org
Subject: mlmmj version?
Message-ID: <20260207053820-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EEQGRraRbxV0m2CE8ja1Wio7Tf0VQVk2RI_FQBiTfbw_1770460813
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

hello!
a recent mlmmj release (1.7.0) has a feature attractive for virtio MLs
(self moderation).

Curious whether lore uses some distro version, or self built, or what.

Thanks!

-- 
mST

