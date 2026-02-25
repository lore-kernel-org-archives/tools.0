Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A853939BE
	for <tools@linux.kernel.org>; Wed, 25 Feb 2026 14:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031508; cv=none; b=r/VbSKKVEpYDr9lcOOynwSofdxWDgennYMV4feD5DyglLDXC87xzaeZmLxlbNMAk9ERk24qbfIE3gvufHR2Kwm8A2TDxiS4RqID5jX2iUvt8g5khcl2I5UnLE/XjODcF4Oq0Pdfzflly1DWhqJGjaPVzg5cibAA1ezLgLedV7iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031508; c=relaxed/simple;
	bh=9r+pRIl87DkmuuEu6PNaWtrMNYGYYylZ7OXc7OZH8XY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KPZatsoHpZcdA92M7jjuxMMccgt5JoEzo011hrhqXuGeOk+TB2gE4qs+KHEbN23+xCBbwWYC3LwYmtfwYQrCiTeC2M7xLZ3pZlVA5FOkJLRu7efKTrquAzQvuUL9Ea1l8q8qvRZPQ9rF+Agzu4XaifmxwroYScCb7BoxI6FYs54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Pzz7c92G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Pzz7c92G"
Received: by smtp.kernel.org (Postfix)
	id 41167C19425; Wed, 25 Feb 2026 14:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA9BC116D0;
	Wed, 25 Feb 2026 14:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772031508;
	bh=9r+pRIl87DkmuuEu6PNaWtrMNYGYYylZ7OXc7OZH8XY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Pzz7c92GdVYRII7XHSJeav2JH+Ont75fmUkUIzuMbjHbzHroLcGznDMgeGcWuulKb
	 TSfkJI9KephZfrmmBvu5A9retyC9JkTVYBI1vHlqNf8xnveISf1ojWpczD64LstsPv
	 rjh8d1IAQOJkp0ozBPBvytP8XimP0NdHReddRVsU=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260225-docs-presubject-v2-1-09f90b52db02@bootlin.com>
References: <20260225-docs-presubject-v2-1-09f90b52db02@bootlin.com>
Subject: Re: [PATCH b4 v2] docs: document --set-presubject and
 b4.send-presubject
Message-Id: <177203150419.23440.172554179395105334.b4-ty@linuxfoundation.org>
Date: Wed, 25 Feb 2026 09:58:24 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-97aec


On Wed, 25 Feb 2026 14:11:01 +0100, Antonin Godard wrote:
> docs: document --set-presubject and b4.send-presubject

Applied, thanks!

[1/1] docs: document --set-presubject and b4.send-presubject
      commit: 3c4b3211bb94c3ea3c1cf3301b8ae73eecc55978

Best regards,
-- 
KR


