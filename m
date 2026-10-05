Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C77143441C
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 09:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191820; cv=none; b=phVNotRP/U3lNeRiY/fKJ8KnZUL/tJhrkm3RGmCFWtgpBvDAZYB/1J9t52/228RMhozjzGaOj/bNVx4/0FeWeaVcRbaWCIBxad+tE0jpwyzEdm4ssPoppqrU8XDnS6LaJEH9+fsPMsIJ3xqpKIePdC2zgkSyXfU4dNZ8AqGWLos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191820; c=relaxed/simple;
	bh=zi/FcM5D+LDqldN6I8LNwQz730XGfWR7dlux3G2Mkbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WQpScSe1o4Nk1pIf3c6yHDBOVoqyjPfCTBSoK5zTMTPhs25fIlq14L7eyAgVBPT7N0DkJoLjxTKCyhWYSLexGz6epo/0IJmh4mEHxz+qTBXjnMi8YlsbK64UAQSfneG+3kdPmuKzNBbb3U6OyzanDAJMAIkDFyhxuqRnrvujBFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ug41vS/g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ug41vS/g"
Received: by smtp.kernel.org (Postfix)
	id E42DB1F00898; Mon,  5 Oct 2026 09:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A0471F00893;
	Mon,  5 Oct 2026 09:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791191818;
	bh=BXC5ZzgQho8luWKre2Bqm0tE1L6IqY2LbSCOOOnHYtY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ug41vS/g6IoauHovjLa/Uxvm5AbJBu/jwO79th8GJ7rSiXQLiAlolC7Hvsy695kyi
	 BnI8Vbdn7cMgvu51HXkwqcJ1dS56eqM4AXTW8iP0l953ApCO/dcU1a/TT4Z+SP2HvG
	 qC8QsWOqsII+sH//biY/TU2hzbnh4O502rO1q+zU=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Maxime Ripard <mripard@kernel.org>
Cc: Konstantin Ryabitsev <mricon@kernel.org>
In-Reply-To: <20260916070306.2361370-1-mripard@kernel.org>
References: <20260916070306.2361370-1-mripard@kernel.org>
Subject: Re: [PATCH] COPYING: Update to current FSF address and boilerplate
Message-Id: <179119181264.1730306.3029163794938630210.b4-ty@b4>
Date: Mon, 05 Oct 2026 09:16:52 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=333;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=nJaaL+L5O1iFmQ1bC7RJY64UIWJZDCwM97z2NNUS4N8=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLIOZ3MUB595NH/N9rVLJi7cUKFzMe67wvd1xY9LtJ+3r
 H0Wy9BQ11HKwiDGxSArpshSti92U1DhQw+59B5TmDmsTCBDGLg4BWAia/YxMhwubdu5X67QkiV4
 RYD4Jq8YqZ+1l/vdlovqTbwY6y0Z9ZDhf3aUx82jHxYapb7Q/rZ3zrzjXOEdFjeM/9/du3qx7u/
 Pp5kA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Wed, 16 Sep 2026 09:03:06 +0200, Maxime Ripard wrote:
> COPYING: Update to current FSF address and boilerplate

Applied, thanks!

[1/1] COPYING: Update to current FSF address and boilerplate
      commit: b3f89f0bdeb7854a1c3fde1c57edff20e1fb83d8

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

