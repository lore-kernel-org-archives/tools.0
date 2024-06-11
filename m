Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57B53D0C5
	for <tools@linux.kernel.org>; Tue, 11 Jun 2024 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718123745; cv=none; b=o6ItgioES10M7Wy1U+hlUmBC9oD7G7FfrMKCCO0lftTiFc93jIzN6ZKxW/1A6uzKtTiGauoZ0Dmzjt8JuqYncrMuM2O8Ibx0OhQh4bydeWexBVoHaBEwUZ8OdjJ7Gb6Q5XfawRE0M+z4eDbPWRZACKXyWLA25N/C4F1vr2BlPr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718123745; c=relaxed/simple;
	bh=01ayuNTNWusEwMj8LiHOLQBd7hkI62XHq9i0oOPiW28=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bJuCmsT70rHos6lP7R+0CcTBJzLFheYmxpTSd9Y7IJ6KuLYYmf9VS7mCA/ZcCZehn0A0Xrs7Y8VBxQ9oX/msIUnUkNnxTVOE8in7zj5+CAX/ZMiZws/xbOyZvD24nqZ3QYSIx+u+yxd86eoXMkaHgyg2bpU1a9akkCyxy5GT0hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sUF9Fs2d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sUF9Fs2d"
Received: by smtp.kernel.org (Postfix)
	id 7C004C4AF1C; Tue, 11 Jun 2024 16:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29FC0C2BD10;
	Tue, 11 Jun 2024 16:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718123744;
	bh=01ayuNTNWusEwMj8LiHOLQBd7hkI62XHq9i0oOPiW28=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sUF9Fs2dYyZu67hGI/CM3Bi58S1JNAiE1MXxSDzahk54l4w5bCcpCJK05uPZVDf5H
	 nVCBCO6nEp/DRqcRG2A2FeDNEH1sg2kc62gOYy4JJQ2ttF+X7S3Ci3Pb40+FSJcHoH
	 kxTu2kq9BN3FUnIN3aIs/sKkXNRAnRxzhqEkieE8=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Quentin Schulz <foss+kernel@0leil.net>
Cc: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240524-doc-send-prefixes-v1-1-c6465822ad8c@cherry.de>
References: <20240524-doc-send-prefixes-v1-1-c6465822ad8c@cherry.de>
Subject: Re: [PATCH b4] docs: document b4.send-prefixes conf option
Message-Id: <171812374402.1968569.3704130932976426387.b4-ty@linuxfoundation.org>
Date: Tue, 11 Jun 2024 12:35:44 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-b96a6


On Fri, 24 May 2024 15:30:35 +0200, Quentin Schulz wrote:
> b4.send-prefixes is a way to define a set of default prefixes from a b4
> configuration file, so let's document it.
> 
> This is available since commit c42dbb0e5040 ("ez: reimplement extra
> prefix functionality"), part of v0.11 tag.
> 
> 
> [...]

Applied, thanks!

[1/1] docs: document b4.send-prefixes conf option
      commit: b96a6e5e55ab8a6b458915f0255da956d1de8126

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

