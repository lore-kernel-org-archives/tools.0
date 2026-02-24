Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371D52DC789
	for <tools@linux.kernel.org>; Tue, 24 Feb 2026 18:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771959470; cv=none; b=b4YuBxjldx92KPtWBEdapde3Nono7zM6CYPquioS5oBEnkGdBP6KXrTkYppogiBeUb3o2IyT9O2m7UqqAtzDhlDxUdShC4k9lXzNkEnsylh9MtfgTWIPCm82Ab43n/xvhr/hErZsjwngqU+ykaFAK7EchzuQR4j16uCVckgAL84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771959470; c=relaxed/simple;
	bh=wcCSFPxWBuCi3S/COx8eh+9IcAjTDhI19Kk992kkYE4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Isr4S/ryUQpVpqjmOf0+aI0+L69izzpVgz2s8jaXYuLm0AmIgvxvX77xoN7RGbb2ug5MXXu+KXg0OJcpFL7WIg9s5zEotPXDIp5oJRwzdlg8TwVmIze/6wuh4ipl23/nMu85+Z2YG2HY7zckUb33ZOGhLfh2iDep63GiclPskJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OprLfAIa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OprLfAIa"
Received: by smtp.kernel.org (Postfix)
	id E28C0C19423; Tue, 24 Feb 2026 18:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CBABC116D0;
	Tue, 24 Feb 2026 18:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771959469;
	bh=wcCSFPxWBuCi3S/COx8eh+9IcAjTDhI19Kk992kkYE4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OprLfAIaPoBt7Sd6h7tlVrRv3FIXlMPP/eWICiOyZE3C5BmUH9p+1XJaIY784MQf+
	 IUa/QE7VGQ27uWn0Sz3OJZibrkZgRoqsD1a/4lwetykU8jJ5wuS55+i69QPSdJyFcG
	 xngEpbzovtDZ1xUX2EbwtnkRwH6MG93tSG1/HNWg=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, Breno Leitao <leitao@debian.org>
Cc: kernel-team@meta.com
In-Reply-To: <20260127-force-cover-letter-v1-1-1ba8d7f9a64f@debian.org>
References: <20260127-force-cover-letter-v1-1-1ba8d7f9a64f@debian.org>
Subject: Re: [PATCH b4] send: Add --force-cover-letter to send separate
 cover for single patch patch series
Message-Id: <177195946358.4019869.10828476841398766948.b4-ty@linuxfoundation.org>
Date: Tue, 24 Feb 2026 13:57:43 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-0bcb0


On Tue, 27 Jan 2026 04:53:08 -0800, Breno Leitao wrote:
> send: Add --force-cover-letter to send separate cover for single patch patch series

Applied, thanks!

[1/1] send: Add --force-cover-letter to send separate cover for single patch patch series
      commit: 858baa2b2eeb93ea1b0e1b57adfb77e4a126043e

Best regards,
-- 
KR


