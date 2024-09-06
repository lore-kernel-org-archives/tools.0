Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DCE1D1740
	for <tools@linux.kernel.org>; Fri,  6 Sep 2024 14:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725632687; cv=none; b=VshEFpFvpHxXE9cP1pLzo7Ay4nxmAwZwRoIQA2rBrxKcsoMHfxWCH7y7adzunF8ilcIjrT2btx+Ao7vi0nzyTieclla3BsoRdA2Kc90Ocuzv3jsxcyu6+0oFuFXYjSAugpS0Vu2oqZn8AuTyntBCJynyEDZ3zpiA9vEImi1aTs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725632687; c=relaxed/simple;
	bh=ksA3MozMatae2P+IJhFmf7eTjQRq59jpG+qbwe4/7oY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VNpJeKP/sMczbbygc5bbu8rjPoZ7zmJg1EFoLWxEq4r99rhlbTDCOCF8ONfvVstCT7hpY1fyrhTnG69JdZlyGMw0uZrIPnm6hXM8y67bw4xzeumLUi/JE8kXUNe38zqsqpiXHtM7xagyAa+tFWsHXeuPOWLkSeInGv8p4UNOzd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=t0Td7pxR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="t0Td7pxR"
Received: by smtp.kernel.org (Postfix)
	id 8E20BC4CECB; Fri,  6 Sep 2024 14:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCC0C4CEC6;
	Fri,  6 Sep 2024 14:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725632686;
	bh=ksA3MozMatae2P+IJhFmf7eTjQRq59jpG+qbwe4/7oY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=t0Td7pxRGW55Wt8KFJhUCcvRoyJM0JoJUrn2P6YJ7FpxhkOnjBeVts4n4n5RdsXc9
	 C9urXY91N6tQvis7t6egPjtvn+W/qZRZkRDYhXPL6NmBLxIqh0zpgMZM/OtqkwsbxN
	 4Ilmn5n5/tLSON1fiTJjJ56NiMUAPFKe0v2d2Z48=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240828-remove-invalid-cc-v1-1-b29dbb379b28@bootlin.com>
References: <20240828-remove-invalid-cc-v1-1-b29dbb379b28@bootlin.com>
Subject: Re: [PATCH b4] Remove message-id from cc list
Message-Id: <172563268611.15267.13838004553368863561.b4-ty@linuxfoundation.org>
Date: Fri, 06 Sep 2024 10:24:46 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-77eae


On Wed, 28 Aug 2024 11:39:51 +0200, Louis Chauvet wrote:
> As the algorithm to detect mails to add in CC is very simple, it also
> include the prerequisite-message-id to CC as they look like mails. In
> order to avoid this kind of issue, filter out prerequisite-message-id
> lines.
> 
> 

Applied, thanks!

[1/1] Remove message-id from cc list
      commit: 77eaedc7de548fdaa289c51f62278633bd815d01

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

