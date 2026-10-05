Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0105D4AD4A1
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 15:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791213552; cv=none; b=S4d7RrjKzg83SDg8vhuB4UBD1uxC8mOcH8n9rb/gMCR0qsYhPj5VFPUignnMUxsMtUUeeav9KPkIi0bETz5GWlgEAcV94rFZUp4ML/1iiixGrwVZbN3q8lOPiv7jGddkP5K7zBgvub62XRMNiMMs0xULztYS+VHWNcYWdiAH1HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791213552; c=relaxed/simple;
	bh=TD5EyXQixVWxfvzrQLhrvvMCsn2MS580oeV9z+8CJ2g=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iFwwJjn+XAx4wkfQNEoOOFobVCmSbioIkecHAI32IhFn6o1AzqmXAnLx49kVZ7M1zCc858BdrBVj4VNJaERHbQJn0NasJh9ZUXp7sUvSnxuXFYaEXKyzYd38YFkWCGThBzWJPfUkNtab1EsdHkfQhX4JAAPauDYdrrs3nLyFqtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XCnsREFR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XCnsREFR"
Received: by smtp.kernel.org (Postfix)
	id 72EF61F00893; Mon,  5 Oct 2026 15:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4951F000FF;
	Mon,  5 Oct 2026 15:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791213550;
	bh=y9U4lgwIZSpGVDHcO+KJpZUjIDmuOPyjvFISfGCbB6M=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=XCnsREFRi47mi7pppif4Vy5ob4u8TZzQnkN7g9gJLbesc+ItxkUSGKBJywpDuCAWe
	 AIvJz+NcyWM0Sjj0lomKxFdPiuM1nqT1zSxf53gge0Y0Gf5mGV5qspHYVZLie3WYCq
	 xxIYqp/iCSrnlgEaaIP0OcEfg5Jj9n/42hyQI8e0=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
In-Reply-To: <20261005-b4-lore-fixes-v2-1-1872d60e13af@baylibre.com>
References: <20261005-b4-lore-fixes-v2-1-1872d60e13af@baylibre.com>
Subject: Re: [PATCH b4 v2] lore: stop a less pager quitting on output that
 fits one screen
Message-Id: <179121352774.1952612.12527983894574902427.b4-ty@b4>
Date: Mon, 05 Oct 2026 15:18:47 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=356;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=D27Z6Or+kAN+XT8xyN2pFbBIvMDrHuRJYjPf11EoVSE=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLIO7799q+h0qrp5r9NU9vc5tzX61qyN2BFb6NLiUHGf5
 4hJ0zG7jlIWBjEuBlkxRZayfbGbggofesil95jCzGFlAhnCwMUpABOZYszwV2jJ69xVQSK3DqQL
 c9wU0/yRsf6Rdfpt49n173yFlmTv1mVkmPEz+0nKm9k/roamOWxdeONHcpfcatVFqSd6Ve9ZRVS
 u5wQA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Mon, 05 Oct 2026 16:47:06 +0200, Clément Le Goffic wrote:
> lore: stop a less pager quitting on output that fits one screen

Applied, thanks!

[1/1] lore: stop a less pager quitting on output that fits one screen
      commit: 7768e1d35ae5e11c79175d6efb4083d57709b690

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

