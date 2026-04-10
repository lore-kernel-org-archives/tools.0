Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2C23D093A
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 14:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775831767; cv=none; b=U13xPEJi5/XukdEwvUL8AyEk6TSG6k7r3wURGcCH3K9fTQhus0m8Y/HOkTo7oE630lz3fAT1ULP34tYTiO9cOTwD7keS4iKuJgP2c64He2xrpcHqK4eghXCCuTI9K+Ccu+shYIGsrglI8Q+Yh+WNANHu4OnUjp5ptFlEoteMvNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775831767; c=relaxed/simple;
	bh=Zaczqjvv96jca4Z/a3MkGgr3d1DncDiHyl4ZIC33frc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KTMkvpFyV84f9PxlXrsB8+tLQI9SlIC3hPbir7fCjFWjsz80It6UhLtwfR16UEvCQOfVpDynLQuG/RIZJmFOWEqm+iRXAPW4ipOV17zLz6oW+GBjEFQqZ6eSgyU85chVtbYcV7Iw8xwAV+dJdYIT40vEnqexLwew1awNcJuhZG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ysxOIUA+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ysxOIUA+"
Received: by smtp.kernel.org (Postfix)
	id 6BBB2C2BC87; Fri, 10 Apr 2026 14:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152F6C19421;
	Fri, 10 Apr 2026 14:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775831767;
	bh=Zaczqjvv96jca4Z/a3MkGgr3d1DncDiHyl4ZIC33frc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ysxOIUA+vMb6Ym2gpsiErewp89HTYt3ocBwZsRi+MTQh0EdWkJe2eNfGI3PDGIA5J
	 LvSl71nNIloOHhCjwUk4wJwHmiJHR8T8JKYfr5vbnIZwT3lSLIrFJn7uIKjqh8gdPh
	 0dPwow9dPaAvMcVn3iuPEm/N34SWcOdXO7y7KBfE=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel . org Tools" <tools@kernel.org>, Bingwu Zhang <xtex@envs.net>
Cc: Bingwu Zhang <xtex@astrafall.org>
In-Reply-To: <20260328232233.57299-2-xtex@envs.net>
References: <20260328232233.57299-2-xtex@envs.net>
Subject: Re: [PATCH] Support SSH user.signingkey
Message-Id: <177583176227.479746.8883097141934474655.b4-ty@b4>
Date: Fri, 10 Apr 2026 10:36:02 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-62088
X-Developer-Signature: v=1; a=openpgp-sha256; l=227;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=JdWJ+P0J/KAMzUF9y/AMcRqLHdWG5ZQxJtEAFySRIrw=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGDJvcl2r25hk9329032li3n7WHJvMG2fY5W3+6Dqi2beG
 6q/RG46dpSyMIhxMciKKbKU7YvdFFT40EMuvccUZg4rE8gQBi5OAZiIZyXDXyG2UwFVe7n2e6je
 yJxwkOnwZ6OQSN8Ti5S/GZWdfqIxP5XhfwzrtUceSvKf/0xd9O7u1UxOA3uzw36HJs/bx7XP0/L
 LNSYA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Sun, 29 Mar 2026 07:22:34 +0800, Bingwu Zhang wrote:
> Support SSH user.signingkey

Applied, thanks!

[1/1] Support SSH user.signingkey
      commit: cff270b5476ff891cf884eabe8cc18e89c9822a5

Best regards,
-- 
KR


