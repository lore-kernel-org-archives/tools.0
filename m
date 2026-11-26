Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680388;
	b=v4Ji7WtGjasUH5jSoCh0Ki1XdD7WTAemrglTZTM5jvfGLov9Dsyrk4wkqSq/RPD2PLHD
	 rV5gF6D6ihk0EP0lxnl67+lvmW/7JkZwZpvUuH91Xh+6M+HHlhWk1QTZPxegdvo5x4Vtb
	 rejPrOvc3EIO9Q/SVPuXS4Bwyu1tBQI7gHoUGGyEMf2T8waCkS66Eo8DapKVuzAXu4NtS
	 7RxEN4FSWHv6GQ37g9dxCx+T/FI+EFudaH9X6Lf90R3gVtjkw5Pm6glP5hNIBAdcy/KFH
	 IPZ/x2iFpFnV61UjX1B/4IgZTReqLSlWICbnO5i91Jc+8PfrTJnEtlLRsduNxg5M71g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680388;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=GOKfO5o1Z3/+oBov/qveq+Twy0DN7jW9muCE4k9wMWE=;
	b=nbPM0yelQzwVMD2fVvkGTJF8OUMMvFdGt5tqpgtTkcUwwHRnYiRziR956tzbqlI04D36
	 aVtvPBv29LbgAbSPvVCex8Te9w5rJt2tKyWPWRD9AZmNCLBVRTeF/n0W0d8BTG/uhi0CK
	 WRA+CXhf0zx39p8+wyrQ+FcFhFJ6SccochKR9Sy9I5+9DQk81xuLIZ20KsvblkqRJ7pYH
	 WZ7Ip9EwJ+PX6BNiUGPyaMqkF4eydvT3pQsioodM4DELCkpUA/A9xfhqHIYgbGwCSuLL4
	 DTdDkPSWiJzoeV+7xmX2iR8DqhuoOGREngWVGZKebAOOiBSOgKFTOrDcdWOBWIv4AqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=UvqBBj1J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C1F606A332
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 08:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=UvqBBj1J
Received: by smtp.kernel.org (Postfix)
	id 339D21F000D3; Thu, 26 Nov 2026 08:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B1B1F000C4;
	Thu, 26 Nov 2026 08:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795680386;
	bh=GOKfO5o1Z3/+oBov/qveq+Twy0DN7jW9muCE4k9wMWE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=UvqBBj1JnxynniYlUgK68lWhW5pD0VBj4QfBbWFUM8INxwUtPejc1cqnF/mhG61Wv
	 Mj4PBvXs2Iu8ZdxOcgDjYUIt2jk1sah/Mc3Ui2Yl1lDWBv0dWte3kq+AN/WDlyLROh
	 5hLnIYT2YwUmrMM6pVUEjXbe2jl71Zu6/tf+HdAk=
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4] am/shazam/pr: allow suppressing thanks records
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20261124-suppress-thanks-v1-1-a0270ecee6bc@gmail.com>
References: <20261124-suppress-thanks-v1-1-a0270ecee6bc@gmail.com>
Date: Thu, 26 Nov 2026 08:06:24 +0000
Message-Id: <179568038413.4097193.14320325595262035034.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=959;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=YlFmxasnFW+DGcGH93RtI5z9q9qGU1UqdSstt1eWoLM=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLZXzSWZT9/euX+tth1FkonOHfESUXxhGRGvvScsWH+q
 x8XJlzc0FHKwiDGxSArpshSti92U1DhQw+59B5TmDmsTCBDGLg4BWAihn4M/5MWZjRvqzCsO93D
 NKE97ZmxZYI/7/2DIUuy2w/wsM9YspeR4ejaxYr+DdVXH+j0Oke9OdD94ozLt5B9H466ZvFtk+N
 l4wEA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> Recording retrieved series and pull requests for later b4 ty use is
> helpful for maintainers who send automated thank-you notes, but it
> accumulates unwanted tracking files for contributors, one-off fetches,
> or maintainers who prefer to write replies themselves.
> 
> Add a b4.thanks-record boolean configuration option (defaulting to yes)
> and matching --thanks-record / --no-thanks-record flags on b4 am,
> b4 shazam, and b4 pr so tracking can be disabled by default or
> overridden per invocation. Invalid configuration values warn and fall
> back to the default.
> 
> Decouple Patchwork review-state updates from writing thanks records so
> b4.pw-review-state continues to work when thanks tracking is suppressed,
> while keeping read-only checks and pull-request explosion unaffected.

Applied with a few tweaks, mostly to make it work on the latest master.

Thanks!

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
