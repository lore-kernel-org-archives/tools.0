Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6124C3E95AA
	for <tools@linux.kernel.org>; Wed, 25 Feb 2026 16:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772037424; cv=none; b=kiFi1hU0bk3QsCqAw6ZXeGjkaQ4MkiyrTx7m7K0RuKOO77EdZGNUWmARFZUJbgI9uPZeS+YGync4YCQ6Ph1LE5wn4fd3iUD0u1wPHhOmRnO1u2d5mOjrpcIp646sVXRpdfwSYFYwfNte2y7pJftmgIUbKGiHjFPIL3W5Tnt/JNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772037424; c=relaxed/simple;
	bh=9ZwJ75NYPV/wQMU2r/FpLuHy015MXArcnLD1awF/6es=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pMND8ijLj04orzz012hCXY7zkPE+zKJN+f8XLgtLZ5pJl3za8vbNueoPWzIvAKNH/Ia9JIQNxtbuo7t4zgfQ5WrwO/qzA9dDamdQITqYOvR2EtylU3QDez6YpBwSKUJKK4qVEwU+PAqX983L21ypsxAIoC7ncjBbqmcJv1TJg50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rvCwnR1B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rvCwnR1B"
Received: by smtp.kernel.org (Postfix)
	id D6A4EC19421; Wed, 25 Feb 2026 16:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE9BC116D0;
	Wed, 25 Feb 2026 16:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772037423;
	bh=9ZwJ75NYPV/wQMU2r/FpLuHy015MXArcnLD1awF/6es=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=rvCwnR1BKt/Y+mydPAIlTaoxrOZGJei5Gg3FPN5ZDVs/PbiKmzPpH5TtdCrMdVugZ
	 nB6YiWuWksvpJPR7nshPWLSjSuVbZurMnof5UNrIOXJCsGJHlY/S41VlSdGXeNJ4Dk
	 fN7V6rhuCK85yz5m5nPXa2/rt7I5x6zCH07gWAo4=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
In-Reply-To: <20260225114241.2609196-2-u.kleine-koenig@baylibre.com>
References: <20260225114241.2609196-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH wotmate v2] export-keyring: Add option to update
 certificate header
Message-Id: <177203741784.47517.7478486241680386558.b4-ty@linuxfoundation.org>
Date: Wed, 25 Feb 2026 11:36:57 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-f479b


On Wed, 25 Feb 2026 12:42:42 +0100, Uwe Kleine-König wrote:
> export-keyring: Add option to update certificate header

Applied, thanks!

[1/1] export-keyring: Add option to update certificate header
      commit: ef63a30d8fd1e8797edbf8a4d67dbdceb5accb8a

Best regards,
-- 
KR


