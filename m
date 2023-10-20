Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E77A208C2;
	Fri, 20 Oct 2023 19:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O8H/+J5k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FABC433C8;
	Fri, 20 Oct 2023 19:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697829024;
	bh=RWNmRJUW7CdRKgXE8KivX8VtRwxGp3A0kbPvOv83e/o=;
	h=Date:From:To:Subject:From;
	b=O8H/+J5kdG2vc0d8VWa8lf+9hdOCywhFm6zM3F+hILj1RTno3sY5YqeDO17Wvme1V
	 UrEJ6n/ybK08QAMViDJDAyqYceg1UVeIvPWIfhV3ExPevIL4L+7/IdOFlWVrhSD1B0
	 tlMAuRP7VDtyusIpnY0uGnzUZRKl+F/Q4k+BFtcw=
Date: Fri, 20 Oct 2023 15:10:23 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: b4 0.12.4 is available
Message-ID: <20231020-gown-landlord-e76fc2@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello:

I just released b4 0.12.4, which contains a small number of bugfixes.

Konstantin Ryabitsev (5):
      Up version to 0.12.4-dev
      ez: ignore invalid unicode returned by get_maintainer
      Only pass -f to sendmail if envelopesender is set
      trailers: do not quote names when special chars are present
      Up release to 0.12.4

Special thanks to the following people who helped with this release, in
reverse-log order:

- Duje Mihanović <duje.mihanovic@skole.hr>
- Nick Desaulniers <ndesaulniers@google.com> 
- Matthew Wilcox <willy@infradead.org>

-K
