Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D44409107
	for <tools@linux.kernel.org>; Wed, 10 Jun 2026 13:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098109; cv=none; b=rmef1V3T5TOdie3/wZyCIAly17RJ3MXqYiCMFsEFXpRV/xGwgzEVjQ9wFNWhlG5WCDS3rJXgtWIN+paFz1hdhCwvz4Bco2vr9Lbd2lav1aP/d2A9j90wiN9U7DHwADEPMSkckuXnWsFRav/3Zb3E5Px12xIZlqwv3oFxgCcSSuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098109; c=relaxed/simple;
	bh=2fOBf7UtihENT7z0S+xdbSo8e0VjfVePciYHPmXwLCk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IvClyi7ggLoFLe1+aPjey2X4mvBqFL1K6vMk9KI5YNSONjeMTuc4X34jrRUOAuaVQNzm7JcJwSSJke4LVxlQ1/oZ3PJ1YmVVEBeFGya3MB6A/3vBKBKdRRJ6YRQSt0qiIAI8qoWfm85CXQe/8v2ZVsod2ZG/VNkDj5JzwbJyyQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ff/+bo0W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ff/+bo0W"
Received: by smtp.kernel.org (Postfix)
	id 73A2D1F00898; Wed, 10 Jun 2026 13:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3A81F00893;
	Wed, 10 Jun 2026 13:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781098108;
	bh=IdCGWw5Sf2wr7wlxxDW69m/upwW3Dw48zAibMRK/gSg=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=ff/+bo0WaANqIU5+4MBWwXPfXGNpdqornuJXrrdt38q2x7awLmPmL9+MZ0Qw4jEKu
	 cs4JerZqQUWhTERYsrPvGhjgN2Tv2IVbGFbU6dxChGBC9+KLmk3PKFx6ZSMWgcM2IT
	 J+1fxwGuvwKxnUxu3msvGvcIEaxBbYg8T3G1G7Y0=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Jeremy Kerr <jk@codeconstruct.com.au>
In-Reply-To: <20260610-master-v2-1-9913cfb7bb3e@codeconstruct.com.au>
References: <20260610-master-v2-1-9913cfb7bb3e@codeconstruct.com.au>
Subject: Re: [PATCH b4 v2] config: add send-me-too configuration
Message-Id: <178109810365.177925.15761980859659908914.b4-ty@b4>
Date: Wed, 10 Jun 2026 13:28:23 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=297;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=/HDFtdQgNmgofZDfkS9SxhdChuSGYaSlYD4KR/ZDHw4=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLI006p/bdgU8PLl5Tkp6fNP+Dva8Ty/eMT31Oz1XXfWv
 t42f+npax2lLAxiXAyyYoosZftiNwUVPvSQS+8xhZnDygQyhIGLUwAmMvkHw/9Ir6P2OockjiuF
 7vVcoD7Z/iCjhMj1X88n7vmpfETiz+mvDP/zTZbGXfl4boHp7sAOldUWrf0Ho17XhO+eKZqcWfW
 jWYcPAA==
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Wed, 10 Jun 2026 10:52:44 +0800, Jeremy Kerr wrote:
> config: add send-me-too configuration

Applied, thanks!

[1/1] config: add send-me-too configuration
      commit: c01d0e69bd1666253839bab79912f440e5edfee0

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

