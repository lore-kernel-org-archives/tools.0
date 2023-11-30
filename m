Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CDA48782
	for <tools@linux.kernel.org>; Thu, 30 Nov 2023 14:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XI9nCY1W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E11AC433C8;
	Thu, 30 Nov 2023 14:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701353337;
	bh=I8X1V70Asz9zT2qleEIdtATaP3qrNqnT5haFta1IWc0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XI9nCY1WuzyZw3dgv3j77+EqmRVUNb0f6SBL1rITyp+REfeDc4FWHyE1ylctgRmji
	 ukm8RX01SA0yFu9ATfuXjdX7OxIr6+mSSyfQ31Qklh4jSXBt8aFB4MOHO4f7kfco2Q
	 41TDNkGiNUhjlvdhODlpc3tHTWhYAO7BADX61z18=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: kernel@pengutronix.de
In-Reply-To: <20231130103925.987426-1-u.kleine-koenig@pengutronix.de>
References: <20231130103925.987426-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH b4] mbox: Suggest git am -3 if b4 am -3 was used
Message-Id: <170135333707.2151080.5223110322939815480.b4-ty@linuxfoundation.org>
Date: Thu, 30 Nov 2023 09:08:57 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-69c0b


On Thu, 30 Nov 2023 11:39:26 +0100, Uwe Kleine-König wrote:
> Preparing the patches for a 3-way merge is only sensible if they are
> applied benefiting from that additional information. So add -3 to the
> git am cmdline suggested in the output of b4 am -3.
> 
> 

Applied, thanks!

[1/1] mbox: Suggest git am -3 if b4 am -3 was used
      commit: 69c0b5b3f3c705fc8a52feb03c2fd35936e5a6a7

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

