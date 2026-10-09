Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04CA3E9C3C
	for <tools@linux.kernel.org>; Fri,  9 Oct 2026 07:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530692; cv=none; b=I49YTjkxNLH5z/Y+hJCKs2I4exwBzM4ghv3NS0Gy9ME6B/w4Px+PF5b3sAR+t4dbKCVn2mt+H78PNVOQa9yibUimcPqVmKve8g4irJzfn8sb9ubif3T0dcdfS6PIs1lm0xMTUm+mrPnGsrnO995/g/QuJO/XWbMk9pcF1vGl5wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530692; c=relaxed/simple;
	bh=A9UmmloccpTcVSJG8lVrRtNPQ2JRU58tR57wJ4VWnlo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O6I6S0zzJqt8bz2JjGyooD1kkJGK0BFeci6cpPAJXYInIdklUT3JjU5KniP3kkxUZkFDtGsDV1fGTTWLR14VmnJLmu0yTshE79UDSvBCYQAZu9O2Y06woE0H7Yfacg5/zUJe5/JN2jNyPBAMlK+ssSshrwnv0jv8s2ojj40pJGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dEG8/+Do; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dEG8/+Do"
Received: by smtp.kernel.org (Postfix)
	id 4CF181F00893; Fri,  9 Oct 2026 07:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F821F000FF;
	Fri,  9 Oct 2026 07:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791530691;
	bh=tTBp8Qa4Oonr+7KVfmut115PRzVsmwXUAoDehlqVesg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dEG8/+Do3wcaWXmjOKjcYPAqpklXfVwKqPBNZEXUudk5id7pxEe27L9KBAUGrD83R
	 PSJGQ3F5QloFUG3DSlYnu2THut5zFNROaUpVLDOufMkTpE3W+hw06tBfbI1pEoHAJ+
	 Iu+l4lggULvysjCFANIhFFtZQNKYeGxaoGIq++mE=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Weijie Yuan <wy@wyuan.org>
Cc: tools@kernel.org
In-Reply-To: <36067800fe19dba18dc4874edfae524346b4ed1d.1786777097.git.wy@wyuan.org>
References: <36067800fe19dba18dc4874edfae524346b4ed1d.1786777097.git.wy@wyuan.org>
Subject: Re: [PATCH b4] send: honor excluded addresses in per-patch Cc
 summary
Message-Id: <179153068211.3568561.14441000336320773160.b4-ty@b4>
Date: Fri, 09 Oct 2026 07:24:42 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=331;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=C0RXJNBz5dfKhXbpHl/4bPJlSIpuUOMlP5nB64Uv0Nw=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJOTNsXos331YVvuVFBnYwU31VLQR8jGZnaGw+CI1aIb
 BY7qP25o5SFQYyLQVZMkaVsX+ymoMKHHnLpPaYwc1iZQIYwcHEKwEROzGZkeOt69mmlj/Xnj7Mc
 D2UvUpuy6PjUvPu73pcVXhd6tP6dWjcjw2+5uHWJEmu3rRb5p2Oq37Csodhb6jmrfWhS1J3+HDk
 edgA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Sat, 15 Aug 2026 14:59:58 +0800, Weijie Yuan wrote:
> send: honor excluded addresses in per-patch Cc summary

Applied, thanks!

[1/1] send: honor excluded addresses in per-patch Cc summary
      commit: 4cacc00431a67964d8842479484c2286787ab978

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

