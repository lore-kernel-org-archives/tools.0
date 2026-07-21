Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E181470440
	for <tools@linux.kernel.org>; Tue, 21 Jul 2026 20:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784665405; cv=none; b=Loj+4ERGCgAhPjKI7ju0p6kzar91Z0NOr7YwOK7rMmNeUI5hNL57ttS/cbTbBRMZKeDlfl8NQ+1AtXsQ/wTAvz8nRgfuFUSBCcIrYDP3nIqHpttei1JP67TFunHulJhb2/xnttZ7FjZSrGkQB4x2yx1QOOY9BjPHjPXRgH7p/Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784665405; c=relaxed/simple;
	bh=VheUyFjVU9ng0r4SkEFyr29NykfPnCi0TEd82kA7oXQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=umheiavZ+YhrI+4EiTUO9vYE/0WpXeFCLYyPOcUkKhoa9OIslh0VMGx+2qYVzeg3KDbIVbC+xEatUuq7h3j1DXsSsIWLGxR+LwPA9ooc6Dw67aHiZD8P/DGKRnXKbnZ2sUXqxI8EJho3L0aIxNuA74an8NtTxQXEramm9pPteJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ibXqXew6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ibXqXew6"
Received: by smtp.kernel.org (Postfix)
	id EB3141F00A3A; Tue, 21 Jul 2026 20:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58931F00A3D;
	Tue, 21 Jul 2026 20:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784665403;
	bh=QNIVhJN4I3pPb5wAQSHxIpqhdOyrvQsbVAdbgXdvJWg=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=ibXqXew6zv6I4kMx1Z9hOWDDd7V9NdJtMBK+rTn3S3a9SCgFYyq7YLz1gfhhAem9z
	 +fi8bJWt7ynjmfDNV1amenZMhuDaYqklewiZ7U2zVw/Wf7cv7lQrSBijfDaZDLHOpa
	 60DD1FuO4ycs7Of2xz/TZwYWFO3Gayk+ZjR6V19I=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
In-Reply-To: <20260714-b4-fix-from-v1-1-8166064bd700@kernel.org>
References: <20260714-b4-fix-from-v1-1-8166064bd700@kernel.org>
Subject: Re: [PATCH b4] Correctly quote usernames when setting From field
Message-Id: <178466540056.2052704.5205698548432340611.b4-ty@b4>
Date: Tue, 21 Jul 2026 20:23:20 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=331;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=CtdfXjx+2+aJ54ijjBREkAaTPxdYjFdE70RiJPm8caQ=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLir1rbXmV5YOVxNTlnr1PxznyZSVPz0+/qe/s/XmK6N
 p313i+XjlIWBjEuBlkxRZayfbGbggofesil95jCzGFlAhnCwMUpABNZp8HIMGmq5pyZ/yq3nXOS
 e5i2fa5FsIxBye07v7jrX7aoLnY+9JqR4UPDJj8bbfXlVifd786eE/7F8Z95ftn8/BtnPeWFPx9
 OYAIA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Tue, 14 Jul 2026 14:28:04 +0100, Lorenzo Stoakes (ARM) wrote:
> Correctly quote usernames when setting From field

Applied, thanks!

[1/1] Correctly quote usernames when setting From field
      commit: 9dec3a07a8d35f076fc2710255aaef086552f04c

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

