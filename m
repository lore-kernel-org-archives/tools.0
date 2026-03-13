Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AB23054EC
	for <tools@linux.kernel.org>; Fri, 13 Mar 2026 03:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773371534; cv=none; b=t9tmxonE0d15AhwXVJI7a+v7D4OywJHNyKLwjBhjT6KZWTuMX+77eg9gZCjlLVzAwlYl95qcp5/begMTSVFBiM+AxHBQHrnoN4jysi7kNn+TYjQNLUcDwqkyAL6hZp9qn6Ft2Eu+F6H2y3Ofr8jvkI7CR0xs46QQ9Cwl47Un99w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773371534; c=relaxed/simple;
	bh=SHq7OMti2w6rfBAed/E0edWqAFFakdOp7FnNrVa/pSA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VYR29kGJ5uuEKwtqFAU9Agxj2KZ4r/IQu/lYgv7AUkmZCCMvBUeWe1zCtbGXArxRi4XekEtXOrCHuhGRCbogSaCDU01vRhCdvcSOyVYyLaxW8yZny64WRFC7ru8PvIDU/IZPoFivvO7y+nAY3EMTOra09csNXHKQE2iYvX5ST+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TddmUT45; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TddmUT45"
Received: by smtp.kernel.org (Postfix)
	id CCFABC19424; Fri, 13 Mar 2026 03:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84EC6C4CEF7;
	Fri, 13 Mar 2026 03:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773371533;
	bh=SHq7OMti2w6rfBAed/E0edWqAFFakdOp7FnNrVa/pSA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=TddmUT45ERWtufFR3NCg1mV4L+QXaxzccVBRe+yASk5nEtn21qybxT+br3Xo+AX+M
	 xak5a1fKRbl3iD7kTTK0y4zRQDFFe5GJUHUOcw8C+WasQV3ek0pgYdQQUto3MACMSF
	 RDQrjNNFFpy5V9hKLaUMCF/533VWs6eDzn6d1eOw=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
In-Reply-To: <20260306162020.54683-1-dtor@chromium.org>
References: <20260306162020.54683-1-dtor@chromium.org>
Subject: Re: [PATCH] b4: allow using xoauth2/bearer token to authenticate
 to SMTP servers
Message-Id: <177336754433.1170490.8483749636926618164.b4-ty@linuxfoundation.org>
Date: Thu, 12 Mar 2026 22:05:44 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-92fc1
X-Developer-Signature: v=1; a=openpgp-sha256; l=413;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=VXk+/qAItEbhT6DoOouMJff2FiuqsX8r9R+U7/h49cY=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGDI3N/SsnzZx6Y5fZbY37GdO2lzCwVY0sVGKyVu48nj2x
 kCxgzIaHaUsDGJcDLJiiixl+2I3BRU+9JBL7zGFmcPKBDKEgYtTACZy9hPD/zB+jv1+3raPdzyb
 zNXV07Lz3K+FFo1KZSwhKoVuTxvdxBkZ/j+Zt+vRkd31T+dUfF/UOnuV3Cpt6bmbO30n+W+8s9q
 cmw8A
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Fri, 06 Mar 2026 08:20:18 -0800, Dmitry Torokhov wrote:
> b4: allow using xoauth2/bearer token to authenticate to SMTP servers

Applied, thanks!

[1/1] b4: allow using xoauth2/bearer token to authenticate to SMTP servers
      https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=7ccea87a5f68

Note: I will fix the small issue I've identified earlier in a fixup commit.

Best regards,
-- 
KR


