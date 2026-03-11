Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5CE3DE43F
	for <tools@linux.kernel.org>; Wed, 11 Mar 2026 15:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242387; cv=none; b=DES4ZXxgljZzszjSPKmG2kCm+Fct/cPjRWsHXvzsz738jXhAFMyL8k6wv3B5J1Dm/Me+gh9JO9h2mDguIWe59MeU8nrk+qX9Ctdtyw7e3QhcwfNcbKDC/YBO3A2ktLY1GqEsoulAbT/ro70BQw6qcYhgkU6wtqlytQ4DDBf4ndk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242387; c=relaxed/simple;
	bh=vtHIi3lXaqadtX4+6rwdndP55sx31Xb7G4sFSQ/M228=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iqYSACsv9537/U9HKkAjJmFsQwXYmJfw32fo35sU6fcXIikAtKdLJTvX9ex9LeHBYQEFKzgqvTOZUkEUkiGZDbTqSQI05O6ngNq1bEWpsmQHIklW2rP2lvxPPvBiNKGDdNlUDmlaRXuQIE2vu6ga1b7mEgE+LoTA5Qx9cUzyZLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Gg7HUJjZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Gg7HUJjZ"
Received: by smtp.kernel.org (Postfix)
	id B972CC19424; Wed, 11 Mar 2026 15:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C323C4CEF7;
	Wed, 11 Mar 2026 15:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773242386;
	bh=vtHIi3lXaqadtX4+6rwdndP55sx31Xb7G4sFSQ/M228=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Gg7HUJjZhYlVGpZb7yEjfWpZTqIvek5hzfaTT9iYR+euNoVvb48+OykY7lZMg7PUB
	 GBMLofFizOAW661Z9GCLWZLuDIGgBWlDfOkqzW/gvCAxjRaGQsgtHOC8Z+cCre3utF
	 +MBagG/48myrtu/E+uiJcAQL6YTrCwM/Fe93tr34=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Brigham Campbell <me@brighamcampbell.com>
In-Reply-To: <20260311074014.289088-1-me@brighamcampbell.com>
References: <20260311074014.289088-1-me@brighamcampbell.com>
Subject: Re: [PATCH] Fix typo in maintainer docs
Message-Id: <177324238051.718772.8510836521550957265.b4-ty@linuxfoundation.org>
Date: Wed, 11 Mar 2026 11:19:40 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cba5b
X-Developer-Signature: v=1; a=openpgp-sha256; l=231;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=eQQEeDOGgextxkD1PvQFYZotn6U7RUy+hvHxdm+ctLw=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGDI3dgj23NM8PL/Iu+vSxIlW/MrlVed1jQKt7iUXxXZov
 L124YhcRykLgxgXg6yYIkvZvthNQYUPPeTSe0xh5rAygQxh4OIUgIl8MGH4H/k/+Ey9eOSxVccy
 ZtSdXVnZenVlyALhewcLP3btnrfunzMjwyRHDvbHR59KtdtmvMhJNQveUf+2/brfXaMH+44dFrq
 7iQsA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Wed, 11 Mar 2026 01:40:14 -0600, Brigham Campbell wrote:
> Fix typo in maintainer docs

Applied, thanks!

[1/1] Fix typo in maintainer docs
      commit: 7e1f9916f6fb508264693476d3f80d4aabd5030d

Best regards,
-- 
KR


