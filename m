Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3083640DB31
	for <tools@linux.kernel.org>; Mon,  5 Oct 2026 09:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791192616; cv=none; b=U47CxPSgdCFozQ9Xi1YTi8OII13R08nUqbB3dN0T7j4mGJjYZrH37DejWD261x5i3A7LXun4sL44lGaFtN2Fl1WRmW04D9ju7vAZxIP54nfD/gHyBXeT8pVCLjiNuvTwahxQOpVtJwELx4Z98sbE33ICJlMX4fiiuI1nOhh8e1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791192616; c=relaxed/simple;
	bh=bSecpeAjzHk+Gb7ldBn/i2NsPA3BrmS+tlS3NSeEPcc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tRQVBUzbkTpiDxWkC+bHNRMmFZJdATEQ0siYAoNqROcrboDgCYzWIiuGQ+GlFUpABE24CMdbT7q3kfNyrl+aX0/Hgeq9jSCT/Ki8Ibk6jxM/C7kexd+uxdb4SiOSuN6DvVbzSbnZT6M4o1GjDzSd6vTl2gXm5x6rTgcfxopBimA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wD2LcPbr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wD2LcPbr"
Received: by smtp.kernel.org (Postfix)
	id EC4581F00893; Mon,  5 Oct 2026 09:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81CD1F000FF;
	Mon,  5 Oct 2026 09:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791192614;
	bh=4xCw/DSnHQF4ksjjkG0sKX5K7uSwrk4phIhfAfHMeys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=wD2LcPbrHYXFbd0YCudb7050rIwnrSRflwaWCTQmjLSAjkNeM+eJhv9pMOylQM/Rd
	 HdZJePEnrfwQlr+PPl7rEwmYCimMjqzA7uHZN8bHH5UTsa/wohAlOuuzt+bUbVALLh
	 rXaswLfsg7Jukvw2BxPIKYIcXNrwDS477D/ynjFY=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: tools@kernel.org
In-Reply-To: <20260928070252.3678339-1-arighi@nvidia.com>
References: <20260928070252.3678339-1-arighi@nvidia.com>
Subject: Re: [PATCH] mbox: add option to save all series revisions
Message-Id: <179119260745.1730306.337828617136114554.b4-ty@b4>
Date: Mon, 05 Oct 2026 09:30:07 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=314;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=HC+LZLgwSDE39ByQqkAp8PcFhySSvW5P3YUZetmIi0g=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLIO56lE7eYK+yh302l95LVc0/z12ycd9bVtZW3+6Jpxc
 9L5opVrOkpZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenAEzEVYuRYVWnxqspR9ZrdmxV
 /HTNZ/O/BRvNzTQez5i0/ATvLvtDFekM/wwOnSoL27Qzpdp3Lvu0b9pnuJ6anOPQf5JdcrJlW18
 9Ex8A
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Mon, 28 Sep 2026 09:02:52 +0200, Andrea Righi wrote:
> mbox: add option to save all series revisions

Applied, thanks!

[1/1] mbox: add option to save all series revisions
      commit: 7dc527669f9cc8dbd11a993fccd0bbcad36d5cdb

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

