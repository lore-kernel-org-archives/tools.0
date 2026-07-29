Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AA94457B4
	for <tools@linux.kernel.org>; Wed, 29 Jul 2026 09:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785319107; cv=none; b=LduXF1Cc71/F+Kc7Fs/ovntncY7WO7Az8G+2imwUjHXtqBFZYI/nCJNIr/WDBn3OmwwZCe8B1ffNenEZdeD89aReUKQ/HxzsgPeVssV4jDrTbWEQVjUVIXRG7AvRVXks3Pq0YP64QeTPxyd3uXBFEUCMjSZbbWRxHGjoYUJmBF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785319107; c=relaxed/simple;
	bh=lDROAoZQB+scqcXeiSEgQ1QtcNRROeRqJZ3EMuPflEA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EJGjHVK+/c8M6an4ThxJnGXaEXev9S/uadXYbwzFVigqlqk3QIbQY1EoRYLOsSQILgM/SoBodUwhhf0oIyk2hOSONC3LjHoTnHpOWgREEP87wwIVJXUKm/qhBki+Ob4vKIGjnqUjoPkFuaKvI8FRZhiE1StN7/op64zPqHfJ8fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Teh6ZETZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Teh6ZETZ"
Received: by smtp.kernel.org (Postfix)
	id AD5D61F00A3A; Wed, 29 Jul 2026 09:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD331F000E9;
	Wed, 29 Jul 2026 09:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785319105;
	bh=VxJNdJHgW6f8TpwNcFSSWIfVXbkD8knMWJcQolUQlso=;
	h=From:Subject:Date:To:Cc;
	b=Teh6ZETZ3IoFZTEFwmKKg9aMBnf1jxsV/JtDMnwRrG4fhu05Ywch8MyT5/6JjXxvW
	 hEqrQKQaq+F9DkPjWa3dO2SK1Q8/tkJ2yFEExgUfrK+LV3tB2O8SdXhuV1yUUtRQUY
	 qR2syxB4oqu4t14aXHik3kOX2ePjZeVMFyU+ZHkyNuylEAhq0JwjU48eWWAaLI0acN
	 d7xxLnYxH9gZvFUl1Xp0DMIX9sf2L31ZAwYlzDo+FJxGZlEi+AmKJbSbmKVkmoLySi
	 bGltev6docdyDmmPkyhHhESC1S5p4hwy5PJH95CmRafE2uL9433Uo4FSyRwcPMUkRM
	 8G3dyJWJY/yfA==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH b4 0/2] b4 tui: preserve the list viewport across rebuilds
Date: Wed, 29 Jul 2026 11:58:18 +0200
Message-Id: <20260729-work-b4-tui-scroll-preserve-v1-0-42be22445eaf@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALrOaWoC/yWMSw7CMAwFr1J5jaW0FCq4CmKRj0MDJUF2WpCq3
 p0EljPvaVYQ4kAC52YFpiVISLFAu2vAjjreCIMrDJ3qjmroTvhO/EDTY54DiuU0TfhiKpWF0Lm
 DH5Q2rvV7KIUy+PD51S9gerj+nczmTjbXbH0ZLYSGdbRjVU8tmRi27QuHzvhlnAAAAA==
X-Change-ID: 20260729-work-b4-tui-scroll-preserve-dd5f70abd1f3
To: "Kernel.org Tools" <tools@kernel.org>
Cc: "Christian Brauner (Amutable)" <brauner@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.16-dev-b7988
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293; i=brauner@kernel.org;
 h=from:subject:message-id; bh=lDROAoZQB+scqcXeiSEgQ1QtcNRROeRqJZ3EMuPflEA=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRlnjuwZxnbo7xXjxSOS2TY+7oksuS/4/rXfTtrzw/OV
 s9vmgyqHaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABP5YcrwT/EKj5fLQeWvfN8Z
 3UwvHXfcG65/efeLBUYBjBIFKc1S3xkZfjRJ2xQpLXjf+j6yd8NUZ47pD5SPqU8QD57+/tbSBff
 fMQMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Updating a series with 'u' in the review tracking TUI made the list
visibly jump towards the top of the screen while the cursor stayed on
the updated entry.  The tracker-style lists rebuild their ListView
wholesale on every refresh, so the scroll offset died with the
replaced widget; restoring the cursor index alone only scrolls the
minimum needed to make that row visible again, which pins the view to
the top of the list or glues the cursor row to the bottom edge.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
Christian Brauner (2):
      b4 tui: preserve list scroll position across ListView rebuilds
      tests: cover scroll preservation across list rebuilds

 src/b4/bugs/_tui.py                | 11 ++++--
 src/b4/review_tui/_common.py       |  3 ++
 src/b4/review_tui/_tracking_app.py |  9 +++--
 src/b4/tui/__init__.py             |  3 ++
 src/b4/tui/_common.py              | 55 ++++++++++++++++++++++++++++-
 src/tests/test_tui_bugs.py         | 72 +++++++++++++++++++++++++++++++++++---
 src/tests/test_tui_tracking.py     | 53 ++++++++++++++++++++++++++++
 7 files changed, 196 insertions(+), 10 deletions(-)
---
base-commit: 99fe195c0aa5a88be5033f87cad22bc32d27cbfe
change-id: 20260729-work-b4-tui-scroll-preserve-dd5f70abd1f3

