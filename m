Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3F326FD9A
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 19:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773690639; cv=none; b=jgHfZ1YoxAwVBOPHKMobrNwWaz2NYUal47U2Z4DcXtdMxccJrla1hYFPNjGOafF8t5/kozVSoachgM3A4mYzbj6LJxUfsUP+zHQ4oAoOmS7N2IG/A8mutiHmeQQ6JusDGu6eAVj3dqe/rLy3AZ9U0+hpLqivDq5p56sX36Bxtrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773690639; c=relaxed/simple;
	bh=UZwsYc7FGF5haXGz2pk166RDWFQnWrO/JZOp8vSfFcE=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=md8e9O9Uu6gk9pZaZjt74OIzW+OsbZLcxGxD2lYE1X2aZHzo/lFAMAYr6GX3iJeW69p6g0lqcgNqjtPYdjJPAPI+KaGZcgpuvZIZSXYdbpDd+Wt3NP+l9+qe/egK+UWISc4/oL+uXtxuy76oXfrXgZz6uvwNN81k75stV4DwuCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YyP3ffNE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YyP3ffNE"
Received: by smtp.kernel.org (Postfix)
	id E2CC7C2BC87; Mon, 16 Mar 2026 19:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB3FC19421;
	Mon, 16 Mar 2026 19:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773690638;
	bh=UZwsYc7FGF5haXGz2pk166RDWFQnWrO/JZOp8vSfFcE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=YyP3ffNEYza90+s3asFXuJ5ci26mZf8mRjECMLb12GrCUsIEA22Ki5uLbC2FjQNwR
	 rBkaN3lT4Xn/xlMLBxih+WPi4RG7qIETnf+HNdZw++yZQAhJHRX6bLUlRizb8WRoLV
	 92GYVuyfxwH+g3BAwsbFG+8+j5JZf1gORqLO10GE=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>
In-Reply-To: <20260316-review-reply-msgid-v2-1-cbecc70a5f53@kernel.org>
References: <20260316-review-reply-msgid-v2-1-cbecc70a5f53@kernel.org>
Subject: Re: [PATCH b4 v2] Centralize b4 Message-ID policy
Message-Id: <177369063409.1710453.1272272356981423830.b4-ty@linuxfoundation.org>
Date: Mon, 16 Mar 2026 15:50:34 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2239c
X-Developer-Signature: v=1; a=openpgp-sha256; l=261;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=yuZprsNyQAJkmcHSefy46aRzfyEk9OlRDA0Td5VjcIU=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGDJ3xPNO7P6ltqjZLvqAPBf//yjD6w0dmr2mV9cfqlVh5
 JVU/pjTUcrCIMbFICumyFK2L3ZTUOFDD7n0HlOYOaxMIEMYuDgFYCKHExn+6e8tlnkh3jBT/l/x
 nFmzxG79/nznZ/6yI+XiHkIbsvf+U2Jk6EraIHrvctjEXZHBKU4GjJy98f1x82OTueIvmUyx3He
 ECQA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Mon, 16 Mar 2026 11:21:55 -0400, Tamir Duberstein wrote:
> Centralize b4 Message-ID policy

Applied, thanks!

[1/1] Centralize b4 Message-ID policy
      https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=4520fe6cfb7c

Best regards,
-- 
KR


