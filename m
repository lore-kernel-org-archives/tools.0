Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522F51DB356
	for <tools@linux.kernel.org>; Wed, 16 Jul 2025 07:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752650515; cv=pass; b=hJjnIQ/RCC91C3NOkbQiue4sQjkJxHT+yMwP6axugFxld7jOFvdKZOo1Eor2h31oC/nZESQjr6NKmmHfkmn0W3qkfjZD9HPETvf6jtsXCg+e75S0rlCEiFdHldxB8QEXL8UXxD6bmA8bVGy2UPEXURDuJ22f08vHU5Ez4bKXOcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752650515; c=relaxed/simple;
	bh=AkPuWWeUQJhENcT1gFpBHZq0JPIIccR9dLhAVW74AmA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q5kRgJoirt179Sq8Ch9yaeegEW2edm56FLI+cOLwM3l7s5wZMhyAiGA4WOIvuv6OTgf5ZtEWbltx6CSi/ZCvrgqqsTlnOznowqf9uZet8dBGvvCFlV/GuiUaSTBQwNF9mupcfmabgfSBMbWDR7ThMoqbCofFgJFNK7RIqq2DsmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b=R0rt1jzs; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b="R0rt1jzs"
Received: by smtp.kernel.org (Postfix)
	id EB238C4CEF6; Wed, 16 Jul 2025 07:21:54 +0000 (UTC)
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07FAAC4CEF5;
	Wed, 16 Jul 2025 07:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07FAAC4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1752650511; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cnM85kQJWO/+MCrFhUq8NSOVNBOE4qL20ARjV2GQCrYKaQpr39w1Ls7NxtkDi+nRm1KyJA8WaiTi7AsZpBfJSDSt0oYZztMs7zXjdWIDoI3659q9Zg1986LWGoT6VbfkM3xwrfVZh+mbM1Yr3+0jV1Y8mAmCo/Cj1yMWScYve60=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752650511; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IIpJiWw1Ou29xyTEQgRTXqdwUQYJ5sXBgiE+2a59EB0=; 
	b=PCO+ccBlG2TRNkJXpK1XDOEKss1X2ScUe0gzS1ZLbeJXP686LPegMU7JtUZ8EWDF5SeO3X3itzTnB2qOsmVLmhH5AadxelPa7zK0GXbAgKHcubbXC0yTjsmD3CRPiByfOUQ6f7mC3O0CZq2Znal6NAhMDyp6mg0OtuIuVlvaJwk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=safinaskar@zohomail.com;
	dmarc=pass header.from=<safinaskar@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752650511;
	s=zm2022; d=zohomail.com; i=safinaskar@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
	bh=IIpJiWw1Ou29xyTEQgRTXqdwUQYJ5sXBgiE+2a59EB0=;
	b=R0rt1jzsQb6CmTCAzeIh7+ZsLwcPaKE6I2Oyz3k8QVM4pW0pkZuxLZd0Ilc7SpEO
	y1tTMlKufV5QNAeLfhYD6EXCR7gwxGh1KUk5iwv4ZCdzURLZ3fNjEOeex5z1Hza/3Ul
	WtDKhMcwBnE4smjzw7t+P76xt8fFTMdBhpiKM8To=
Received: by mx.zohomail.com with SMTPS id 1752650509175629.2844300355805;
	Wed, 16 Jul 2025 00:21:49 -0700 (PDT)
From: Askar Safin <safinaskar@zohomail.com>
To: sashal@kernel.org
Cc: linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tools@kernel.org
Subject: Re: [RFC v3 1/4] kernel/api: introduce kernel API specification framework
Date: Wed, 16 Jul 2025 10:21:41 +0300
Message-Id: <20250716072141.12-1-safinaskar@zohomail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250711114248.2288591-2-sashal@kernel.org>
References: <20250711114248.2288591-2-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr08011227666c370a0d35c4a6bf42ce4f000045dfe4322eadd210ecb86cc17d9d320dcfc3d4d625dddab1ed:zu08011227c28c1fdd9a0e5094b968d0ed00000dfb7426e01319edee5c0453ace9e646d2dab386dc098e69ad:rf0801122cd6016866342085134ea12899000023550669c06db70ba8affa3c6479a07dcc0848304c06d0b92c561d258e06:ZohoMail
X-ZohoMailClient: External

> +   KAPI_PARAM_IN       = (1 << 0),
> +   KAPI_PARAM_OUT      = (1 << 1),
> +   KAPI_PARAM_INOUT    = (1 << 2),

There is no need for KAPI_PARAM_INOUT. It could be replaced by KAPI_PARAM_IN | KAPI_PARAM_OUT

--
Askar Safin
