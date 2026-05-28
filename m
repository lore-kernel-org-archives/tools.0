Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277C734B682
	for <tools@linux.kernel.org>; Thu, 28 May 2026 21:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780003258; cv=none; b=OYoz8dLutki96GtNsGJKJkeV4b4L+thBau5+fcI5iLRgXN51CSaZcVCkd4XNzOB7ufewKU60vf6OD7W/pXhrK1tI7H68/t9unCnzSMIWXPJC5Ez/qsBztvFksDE0gfgzrfP9VpC9o0Wqdgfl/LWf4nWF+8MSgo+7v8qkCBsXRDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780003258; c=relaxed/simple;
	bh=Qfl5oPuMqKcri+zUVxfVj/jxpNIZ+iFawoKTn4J4ko4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=K3/KQGt7v7niF4Wri/LXW8mVj/CAn8I0ToecnzAeSVy/aY+1CBMUn69NBuPnk2ZMsQzP++c1kmDuQYLl8OAI/fHsylulzIPbvgXi7jJHWZr1H4jIZ66j56stH1ci5XHxRbWdQphQMDZqPYW3kJsd5DgsdiAw2XxXgMS+sUT8rQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vdYdP5bb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vdYdP5bb"
Received: by smtp.kernel.org (Postfix)
	id DCE5D1F00A3A; Thu, 28 May 2026 21:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FBA1F000E9;
	Thu, 28 May 2026 21:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780003256;
	bh=856NMcdM0Qy4SAhdk5CxX69Qyted4FzcdMoJ7Ls5eIk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=vdYdP5bbT3BEez+/xgqt80Olt0t+aEsKJZ8L5l8YsQUjTco602OyJTwEEY2/FLe7X
	 HTYNA03mAr4CggzM70vK3q+9OJ9sQy1pgA9iBdFwwtnsKSVsFpsPZT14qKETNeSJag
	 J8m31PBIUDnJNpCtxTfByEPyIZVe1MMe+Sp+Df8Y=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: b4 cannot be built without tui extra?
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Maxime Ripard <mripard@redhat.com>
Cc: tools@kernel.org
In-Reply-To: <20260515-uber-pigeon-of-opportunity-c3bb74@houat>
References: <20260515-uber-pigeon-of-opportunity-c3bb74@houat>
Date: Thu, 28 May 2026 17:20:49 -0400
Message-Id: <178000324957.1946062.14834752913778805773.b4-reply@b4>
X-Mailer: b4 0.16-dev-daaca
X-Developer-Signature: v=1; a=openpgp-sha256; l=385;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=Qfl5oPuMqKcri+zUVxfVj/jxpNIZ+iFawoKTn4J4ko4=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLIkNu7Itj96IStZ+UHQD5u0n7JeFd92OM93tqz7MXc/e
 /uOlqKAjlIWBjEuBlkxRZayfbGbggofesil95jCzGFlAhnCwMUpABPZ9IKR4XRY0JWHPEwB8YdM
 glY6TGW/Wc35qkIp532QZkXfos1h5Qx/BQPFffcYP54U4nP26KGZRsnM7zvmLVgj1dARYLvtjnE
 UBwA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On Fri, 15 May 2026 10:22:39 +0200, Maxime Ripard wrote:
> Hi Konstantin,
> 
> I've been trying to update the b4 fedora package to 0.15.* and all
> releases so far seem to error out when building without the tui extra:

Thanks for that! I just added a fix for this in master and I'll work to
backport it to 0.15.y.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

